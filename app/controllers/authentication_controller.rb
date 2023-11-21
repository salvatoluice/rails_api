class AuthenticationController < ApplicationController
  include Authentication

  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = encode_token(user_id: user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def logout
    render json: { message: 'Logged out successfully' }, status: :ok
  end

  def signup
    role = params[:role]
    if role.present? && !['user', 'admin', 'seller'].include?(role.downcase)
      return render json: { error: 'Invalid role' }, status: :unprocessable_entity
    end

    user = User.new(user_params)

    # Check if the role is specified and valid
    user.role = role.downcase if role.present?

    if user.save
      token = encode_token(user_id: user.id)
      render json: { token: token }, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def signup_user
    params[:role] = 'user'
    signup
  end

  def signup_admin
    params[:role] = 'admin'
    signup
  end

  def signup_seller
    params[:role] = 'seller'
    signup
  end

  private

  def user_params
    params.permit(:full_name, :email, :phone, :role, :password, :password_confirmation)
  end
end


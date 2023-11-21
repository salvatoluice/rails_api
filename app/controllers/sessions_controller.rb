class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      # Generate and return a token (you'll need to implement this)
      token = generate_token_for_user(user)
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # Other actions like logout (destroy session) can be implemented here...
end

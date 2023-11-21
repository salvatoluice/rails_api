class ShopsController < ApplicationController
  before_action :authenticate_user! # Assuming Devise is used for authentication
  before_action :authorize_admin, except: [:index, :show]

  # GET /shops
  def index
    @shops = Shop.all
    render json: @shops
  end

  # GET /shops/1
  def show
    render json: @shop
  end

  # POST /shops
  def create
    @shop = build_shop_for_user(user_params)

    if @shop.save
      render json: @shop, status: :created
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shops/1
  def update
    if @shop.update(shop_params)
      render json: @shop
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shops/1
  def destroy
    @shop.destroy
    render json: { message: 'Shop was successfully deleted' }
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :title, :category, :image)
  end

  def user_params
    params.require(:shop).permit(:name, :title, :category, :image, :user_id)
  end

  def build_shop_for_user(user_params)
    user = User.find(user_params[:user_id])
    user.build_shop(shop_params)
  end

  def authorize_admin
    unless user_is_admin?(current_user)
      render json: { error: 'Unauthorized access' }, status: :unauthorized
    end
  end

  def user_is_admin?(user)
    user&.admin?
  end
end

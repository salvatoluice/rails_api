    class ShopsController < ApplicationController
  before_action :authorize_admin, except: [:index, :show]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  def index
    @shops = Shop.all
    render json: @shops
  end

  # GET /shops/1
  def show
    render json: @shop
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  def create
    @shop = Shop.new(shop_params)

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
    params.require(:shop).permit(:name, :user_id)
  end

  def authorize_admin
    unless current_user&.admin?
      render json: { error: 'Unauthorized access' }, status: :unauthorized
    end
  end
end

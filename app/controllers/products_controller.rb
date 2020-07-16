class ProductsController < ApplicationController
  require 'payjp'

  before_action :authenticate_user!, only: [:buy_confirmation, :edit, :update, :destroy]
  before_action :set_category, only: [:edit, :update]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :set_card, except: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_destination, except: [:index, :new, :create, :show]

  def index
    @products = Product.all.order("created_at DESC").limit(3)
  end

  def new
    unless user_signed_in?
      redirect_to root_path
    end
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @grandchild_category = @product.category
    @child_category = @grandchild_category.parent
    @category_parent = @child_category.parent
    @category = Category.find(params[:id])
    @category_children = @product.category.parent.parent.children
    @category_grandchildren = @product.category.parent.children
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_to product_path(product)
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def show
    @same_user_items = Product.where(user_id: @product.user_id).order(created_at: "DESC").limit(3)
    @same_category_items = Product.where(category_id: @product.category_id).order(created_at: "DESC").limit(3)
  end

  def buy_confirmation
    @product = Product.find(params[:id])
    return unless @card.present?

    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  private
  def product_params
    params.require(:product).permit(:name, :text, :category_id, :price, :shipping_cost_id, :prefecture_id, :brand_id, :status_id, :buyer_id, :day_id, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @product = Product.find(params[:id])
  end

  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_destination
    @destination = Address.find(current_user.id)
  end
end
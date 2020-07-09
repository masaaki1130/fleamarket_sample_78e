class ProductsController < ApplicationController
  before_action :set_categories, only: [:edit, :update]


  def new
    unless user_signed_in?
      redirect_to root_path
    end
    @product = Product.new
    @product.images.new
    @category_parent_array = ["---"]
    @category_parent_array = Category.where(ancestry: nil)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private
  def product_params
    params.require(:product).permit(:name, :text, :category_id, :price, :postage, :area, :brand_id, :status_id, :day_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  

end
class ProductsController < ApplicationController
  before_action :set_categories, only: [:edit, :update]


  def new
    @product = Product.new
  end

  def create
    product.create(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:name, :image, :text, :category_id, :brand_id, :status, :charges, :price, :postage, :area, :day, :user_id)
  end

  def set_categories
    @categories = Category.where(ancestry: nil)
  end

end
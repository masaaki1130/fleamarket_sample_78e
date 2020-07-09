class ProductsController < ApplicationController
  before_action :set_categories, only: [:edit, :update]


  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @products = Product.new(product_params)
    if @products.save
      redirect_to root_path
    else
      render :new
    end
  end
  private
  def product_params
    params.permit(:name, :text, :category_id, :charges, :price, :postage, :area, :user_id, brand_id: [:product_id], status_id: [:product_id], day_id: [:product_id])
  end

  def set_categories
    @categories = Category.where(ancestry: nil)
  end

end
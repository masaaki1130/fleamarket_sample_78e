class ProductsController < ApplicationController

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

  private
  def product_params
    params.require(:product).permit(:name, :text, :category_id, :price, :postage, :area, :brand_id, :status_id, :day_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
class ProductsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

end

class ItemsController < ApplicationController
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :purchase, :buy]

  def index
    @parents = Category.where(ancestry: nil)
  end

  #jsonで親の名前で検索し、紐づく小カテゴリーの配列を取得
  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  #jsonで子カテゴリーに紐づく孫カテゴリーの配列を取得
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  #親カテゴリー
  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def item_params
    params.require(:item).permit(
      :category_id,
      :size_id, 
      #省略
      )
  end
end
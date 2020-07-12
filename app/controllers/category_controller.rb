class CategoryController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13)
    - @parents.each do |parent|
      = parent.name
    - parent.children.each do |child|
      = child.name
    - child.children.each do |grandchild|
      = grandchild.name
        end
      end
    end
  end
end

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @Category = Category.find params[:id]
  end
end

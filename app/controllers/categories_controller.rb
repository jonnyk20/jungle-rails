class CategoriesController < ApplicationController
  def new
  end

  def create
  end

  def index
    @categories = Category.all.order(created_at: :desc)
  end


end

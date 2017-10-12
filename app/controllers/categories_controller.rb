class CategoriesController < ApplicationController
  before_filter :authorize
  def new
  end

  def create
  end

  def index
    @categories = Category.all.order(created_at: :desc)
  end


end

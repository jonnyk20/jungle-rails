class ProductsController < ApplicationController
  def new
  end

  def create
  end
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end

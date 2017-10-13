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
    @reviews = @product.reviews.order(created_at: :desc)
    @review = @product.reviews.new
  end

end

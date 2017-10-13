class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    # raise params
    @product = Product.find(params[:product_id])
    # @review = @product.reviews.new([:review])
    @review = @product.reviews.new(review_params)
    # after @review has been initialized, but before calling .save on it:
    @review.user = current_user
    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product), :flash => { :error => "Save failed!" }
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end
 
  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end
end

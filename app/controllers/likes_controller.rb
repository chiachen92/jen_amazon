class LikesController < ApplicationController
  before_action :autheticate_user

  def create
    # @product = Product.find params[:product_id]

    @review = Review.find params[:review_id]

    like = Like.new user: current_user, review: @review
  # some how have to make a creating a new like associated with current_user and a review

  # or: like = Like.new
  # like.review = review
  # like.user = current_user

  # or: like = current_user.likes.new
  # like.review = review
    if like.save
    redirect_to product_path(@product),
    notice: "Liked Review!"
    else
    redirect_to product_path(@product),
    alert: like.errors.full_messages.join(", ")
    end
  end

  def destroy
    @product = Product.find
    review = Review.find params[:review_id]
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to product_path(product),
    notice: "Like deleted!"
  end
end

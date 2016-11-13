class ReviewsController < ApplicationController
  before_action :autheticate_user



  def create
    # create an answer associated with this question
    @product = Product.find params[:product_id]
    # FIND THE PRODUCT WITH this review
    review_params = params.require(:review).permit(:body, :star_count)
    @review = Review.new review_params
    # @review.product = @review
    @review.product = @product
    # review that belongs to this product
    @review.user_id = session[:user_id]
    respond_to do |format|
      if @review.save
        format.html{redirect_to product_path(@product), notice: "Review created!"}
        format.js { render :create_success }
          # redirect_to show page of products
      else
        # flash[:alert] = "Please fix errors."
        # render "/products/show"
        format.html{ render 'products/show'}
        # products/show.html.erb, currently in reviews controller and trying to render products show.html.erb therefore need products/
        format.js {render :create_failure}
        # render :create_failure don't need to do / because already in review_controller this html file therefore it will just do the default view
      end
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@product), notice: "Review deleted"
  end


  # why is it product_id because of the new url?


end

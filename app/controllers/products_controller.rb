class ProductsController < ApplicationController

  before_action :autheticate_user, except:[:index, :show]
  def new
    @product = Product.new
    @category = Category.new
  end

  def create
    # need to think about the model what columns did I make, params
    # product_params is variable I call it anything I want
    # require the Products table in the database(model), allow title and description and price, for security reason to only allow certain parameters to be passed from the user
    # byebug
    product_params = params.require(:product).permit([:title, :description, :price, :category_id, tag_ids: []])
    @product = Product.new product_params

    @product.user_id = session[:user_id]
    if @product.save
      redirect_to product_path(@product)
      # this is redirecting to the index page, I want it to redirect to show page
    else
      # or display the form in new.html.erb
      render :new

    end
  end

  def show
    @product = Product.find params[:id]

    # @category = Category.find(@product.category_id)
    # had an undefined method error's for nil:NilClass this means it's not defined somewhere!!! needed this line:
    @review = Review.new
    # @favorite = @product.favorite_for(current_user)

    # @favorite requires a product association
    # stuck on this @review
    # form wasn't showing because of @products!!!!!!!!!
    # show this product with id that was just created
    respond_to do |format|
      format.html {render}
      format.json {render json: @product.to_json(include: :reviews)}
    end
  end
  # the action 'index' could not be found for Products Controller. form doesn't know where to submit/post after you hit the create Product button. We want to view the new product detail in the show page, but i was redirecting it to the index page with products_path. prouduct_path: show page path.

  def index
    # @products = Product.all
    @products = Product.order(created_at: :desc)

    # display the newest product user created first

    respond_to do |format|
      format.html {render}
      format.json {render json: @products.to_json}
    end
  end

  def edit
    @product = Product.find params[:id]
  end
  # productsController#edit is missing a template error, therefore make a view page

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
    # index page
  end

def update
  #redirect to show page
  @product = Product.find params[:id]
  product_params = params.require(:product).permit(:title, :description, :price, tags_ids:[])
  # missing :tag_id not passing through the permit at all
  if @product.update product_params
    redirect_to product_path(@product)
    # redirect to show page
  else
    render :edit
  end
end





end

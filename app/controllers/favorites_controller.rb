class FavoritesController < ApplicationController
  before_action :autheticate_user
  # all products
  # thumbs up favorite
  # go to favorite nav bar will see favorite

  def index
    @products = current_user.favorited_products
  end

  def create
    @product = Product.find params[:product_id]
    # find the product the favorite will be used on
    # favorite = Favorite.new(user: current_user, product: product)
    # favorite = current_user.favorites.new
    # or favorite = current_user.favorite.new so that only the user who owns the favorite can create/delete it
    # calling methods on the object

    # if cannot? :favorite, product
    #   redirect_to product_path(product),
    #   notice: "Access Denied"
    #   # redirecting to the products show page
    # elsif
    #   favorite.save
    #   redirect_to product_path(product),
    #   notice: "Favorite saved"
    # else
    #   redirect_to product_path(product),
    #   alert:
    #   favorite.errors.full_messages.join(", ")
    # end
    favorite = Favorite.new user: current_user, product: @product

    if favorite.save
      redirect_to product_path(@product), notice: "favorite saved!"
    else
      redirect_to product_path(@product), alert:
      favorite.errors.full_messages.join(", ")
    end
  end

  def destroy
    product = Product.find params[:product_id]


    # favorite = current_user.favorites.find params[:id]

    favorite = Favorite.find params[:id]
    favorite.destroy

    favorite.destroy
    redirect_to product_path(product), notice: "Favorites removed!"

    # same as: product = Product.find params[:product_id]
    # favorite = Favorite.find params[:id]
      # favorite.destroy
      # redirect_to product_path(product),
      # notice: "Favorite deleted"


  end
end

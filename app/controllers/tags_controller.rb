class TagsController < ApplicationController

  def show
    @tag = Tag.find params[:tag_ids]
    @products = @tag.products
  end

  def new
    @tag = Tag.new
  end

  # def create
  #
end

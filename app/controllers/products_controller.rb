class ProductsController < ApplicationController

  def new
    @title = "Add product"
  end

  def index
    @title = "All products"
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

end

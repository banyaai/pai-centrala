class ProductsController < ApplicationController
  before_filter :authenticate, :only => [:new, :create, :destroy, :show]
  before_filter :admin_user, :only => [:new, :create, :destroy]

  def new
    @product = Product.new
    @title = "Add product"
  end

  def index
    @title = "All products"
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "Product added successfuly"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def destroy
    Product.find(params[:id]).update_attributes(:amount => 0)
    flash[:success] = "Product deleted."
    redirect_to products_path
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end

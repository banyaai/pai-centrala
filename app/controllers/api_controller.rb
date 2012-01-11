class ApiController < ApplicationController
  respond_to :json
  before_filter :authenticate

  def index
    respond_with to_client
  end

  def update
    if Product.exists?(:id => params[:id])
      @product = Product.find(params[:id])
      @product.amount -= params[:amount].to_i
      if @product.amount < 0
        return head(:not_modified)
      else
        @product.save
        return head(:ok)
      end
    else
      return head(:not_found)
    end
  end

  private
    
    def to_client
      Product.all.map { |p| {"id" => p.id, "name" => p.name, "prize" => p.prize, "amount" => p.amount} }
    end

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "user" && password == "K3JZGDptJmWeN"
      end
    end
end

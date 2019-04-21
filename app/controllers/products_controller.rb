class ProductsController < ApplicationController

  def index
    @products = Product.where(publish: true)
  end

  def show
    @product = Product.find params[:id]
  end

end

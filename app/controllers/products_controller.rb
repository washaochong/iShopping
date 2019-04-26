class ProductsController < ApplicationController

  def index
    @products = Product.where(publish: true)
  end

  def show
    @product = Product.find params[:id]
  end

  def add_to_cart
    @product = Product.find params[:id]
    current_cart.add_product_to_cart(@product)
    redirect_back(fallback_location: root_path)
  end

end

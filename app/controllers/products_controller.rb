class ProductsController < ApplicationController

  def index
    @products = Product.where(publish: true)
  end

  def show
    @product = Product.find params[:id]
  end

  def add_to_cart
    @product = Product.find params[:id]
    if current_cart.products.include?(@product)
      flash[:warning] = "该商品已加入到购物车,不能重复加入"
      redirect_back(fallback_location: root_path)
    else
      current_cart.add_product_to_cart(@product)
      redirect_back(fallback_location: root_path)
    end
  end

end

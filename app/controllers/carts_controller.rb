class CartsController < ApplicationController
  def show
    cart = current_cart
    @products = cart.products
    @cart_items = cart.cart_items
    
  end
end

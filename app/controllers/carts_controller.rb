class CartsController < ApplicationController
  def index
  end

  def checkout
    @order = Order.new
    @addresses = current_user.addresses
  end

  def destroy
    current_cart.cart_items.delete_all
    redirect_back(fallback_location: root_path)
  end
end

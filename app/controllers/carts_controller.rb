class CartsController < ApplicationController
  def index
  end

  def destroy
    current_cart.cart_items.delete_all
    redirect_back(fallback_location: root_path)
  end
end

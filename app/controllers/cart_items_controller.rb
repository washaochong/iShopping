class CartItemsController < ApplicationController
  def destroy
    cart_item = CartItem.find params[:id]
    cart_item.destroy
    redirect_back(fallback_location: root_path)
  end
end

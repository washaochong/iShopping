class CartItemsController < ApplicationController

  def edit
  end

  def update
    cart_item = CartItem.find params[:id]
    cart_item.update cart_item_params
    redirect_back(fallback_location: root_path)
  end

  def destroy
    cart_item = CartItem.find params[:id]
    cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end

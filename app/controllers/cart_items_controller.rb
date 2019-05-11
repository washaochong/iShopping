class CartItemsController < ApplicationController

  def edit
  end

  def update
    cart_item = CartItem.find params[:id]
    quantity = params[:cart_item][:quantity]
    if quantity.to_i <= cart_item.product.repertory.to_i
      cart_item.update cart_item_params
    else
      flash[:alert] = "库存不足，所购商品数量不能超过#{cart_item.product.repertory}"
    end
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

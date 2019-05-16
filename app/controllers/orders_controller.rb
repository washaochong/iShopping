class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:create, :show]

  def create
    @address = Address.find params[:address_id]
    order = Order.new order_params
    order.address_id = @address.id
    order.user_id = current_user.id
    if order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order_id = order.id
        product_list.picture = cart_item.product.avatar.mini.url
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.product_quantity = cart_item.quantity
        product_list.save
      end
      redirect_to order_path(order.token)
      flash[:notice] = "已生成订单！"
    end
  end

  def show
    @order = Order.find_by(token: params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:total_money)
  end
end

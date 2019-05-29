class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
    @user = @order.user
    @product_lists = @order.product_lists
  end

  def ship
    @order = Order.find params[:id]
    @order.ship!
    OrderMailer.notify_ship(@order).deliver!
    redirect_back(fallback_location: root_path)
  end

  def deliver
    @order = Order.find params[:id]
    @order.deliver!
    redirect_back(fallback_location: root_path)
  end

  def return_good
    @order = Order.find params[:id]
    @order.return_good!
    redirect_back(fallback_location: root_path)
  end

  def cancel
    @order = Order.find params[:id]
    @order.cancel_order!
    OrderMailer.notify_cancel(@order).deliver!
    flash[:alert] = "订单已取消"
    redirect_back(fallback_location: root_path)
  end

end

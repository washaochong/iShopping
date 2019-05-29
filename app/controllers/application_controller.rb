class ApplicationController < ActionController::Base

  helper_method :current_cart

  def require_admin
    if !current_user.is_admin
      flash.alert = "sorry~~您没有权限"
      redirect_back(fallback_location: root_path)
    end
  end

  def current_cart
    @current_cart ||= find_cart
  end

  private
  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end
end

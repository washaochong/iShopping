module CartItemsHelper
  def product_quantity(product)
    current_cart.cart_items.find_by(product_id: product.id).quantity
  end
end

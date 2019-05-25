class Order < ApplicationRecord
  belongs_to :user
  before_create :generate_token
  belongs_to :address
  has_many :product_lists

  def generate_token
    self.token = SecureRandom.uuid
  end

  def pay!
    self.update_columns(is_paid: true)
  end

  def set_payment_method!(method)
    self.update(payment_method: method)
  end
end

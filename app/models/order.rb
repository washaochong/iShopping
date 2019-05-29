class Order < ApplicationRecord
  belongs_to :user
  before_create :generate_token
  belongs_to :address
  has_many :product_lists
  include AASM

  aasm do
    state :order_placed, initial: true #默认状态“已下单”
    state :paid                        #已付款
    state :shipping                    #已发货，运送中…
    state :shipped                     #已收获
    state :order_cancelled             #取消订单
    state :good_returned               #退货

    event :make_payment, after_commit: :pay! do
      transitions from: :order_placed, to: :paid
    end

    event :ship do
      transitions from: :paid ,        to: :shipping
    end

    event :deliver do
      transitions from: :shipping,     to: :shipped
    end

    event :return_good do
      transitions from: :shipped,      to: :good_returned
    end

    event :cancel_order do
      transitions from: [:order_placed, :paid], to: :order_cancelled
    end
  end

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

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :qty, numericality: { only_integer: true }

  after_create :confirmation_to_user
  
  private

  def confirmation_to_user
    UserMailer.user_order_status(order.user.email, order.name, product.title, product.price).deliver_later(wait: 1.minutes)
  end
end

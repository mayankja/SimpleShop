class Order < ApplicationRecord
  has_many :order_items, dependent: :nullify
  belongs_to :user
  belongs_to :address

  validates :name, presence: true

  def as_json(options = {})
    super(options).merge(addresses: address)
  end
end

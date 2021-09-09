class Product < ApplicationRecord
  belongs_to :region
  has_many :order_items, dependent: :nullify

  validates :title, :description, :image, :price, :sku, :stock_number, presence: true
end

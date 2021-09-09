class Region < ApplicationRecord
  belongs_to :country_detail
  belongs_to :tax
  has_many :products, dependent: :nullify

  validates :title, :currency, presence: true
end
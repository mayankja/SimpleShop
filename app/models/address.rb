class Address < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :nullify

  validates :address, :pincode, :house_num, :area, :city, :state, presence: true
end

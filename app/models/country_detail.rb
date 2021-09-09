class CountryDetail < ApplicationRecord
  has_many :regions, dependent: :nullify
end

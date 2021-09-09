class Tax < ApplicationRecord
  has_many :regions, dependent: :nullify
end

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context 'validations' do
    it do
      should validate_numericality_of(:qty)
    end

    it do
      should belong_to(:order)
      should belong_to(:product)
    end
  end
end

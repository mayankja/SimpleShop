require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validations' do
    it do
      should validate_presence_of(:name)
    end

    it do
      should belong_to(:user)
      should belong_to(:address)
    end

    it do
      should have_many(:order_items)
    end
  end
end

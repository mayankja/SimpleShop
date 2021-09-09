require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    it do
      should validate_presence_of(:title)
      should validate_presence_of(:description)
      should validate_presence_of(:image)  
      should validate_presence_of(:price)
      should validate_presence_of(:sku)
      should validate_presence_of(:stock_number)
    end

    
    it do
      should belong_to(:region)
    end

    it do
      should have_many(:order_items)
    end
  end
end

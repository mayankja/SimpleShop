require 'rails_helper'

RSpec.describe Region, type: :model do
  context 'validations' do
    it do
      should validate_presence_of(:title)
      should validate_presence_of(:currency)   
    end

    it do
      should have_many(:products)
    end

     it do
      should belong_to(:country_detail)
      should belong_to(:tax)
    end
  end
end

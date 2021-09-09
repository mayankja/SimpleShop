FactoryBot.define do
  factory :product do
    title {'tshirt'}
    description {'test'}
    image {'swati33@yopmail.com'}
    price {10}
    sku { "swasdfsdti" }
    stock_number  { "12" }
    region
  end
end
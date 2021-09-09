FactoryBot.define do
  factory :product do
    title {'tshirt'}
    description {'test'}
    image {'test@yopmail.com'}
    price {10}
    sku { "swaggsdfsdti" }
    stock_number  { "12" }
    region
  end
end
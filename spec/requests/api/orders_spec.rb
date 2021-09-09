require 'rails_helper'

RSpec.describe "Api::Orders", type: :request do
  let!(:user) { create(:user) }
  let!(:region) {create(:region)}
  let!(:product) { create(:product, region_id: region.id) }
  let!(:token) {JWT.encode({ user_id: user.id }, 'dfdfdfdfdfdfdf')}
  let(:param_attrs) do
      {
        "name" => "Order",
        "user_id" => user.id,
        "image" => "gffgfdg",
        "addresses"=>  {
          "address"=> "Gandhi Nagar",
          "pincode"=> "452001",
          "house_num"=> "Gandhi Nagar",
          "area"=> "Gandhi Nagar",
          "city"=> "Indore",
          "state"=> "MP"
        },
        "order_item"=> {
          "qty"=> "2",
          "product_id"=> product.id
        }
      }
      
  end
  let(:params) { param_attrs }
  # let!(:params) {title: "utc111",country_detail_id: "1",currency: "usd",tax_id: "1"}
  before do
    allow_any_instance_of(Api::OrdersController).to receive(:current_user) { user }
  end

  it "creates orders with valid token" do
    response = post api_orders_path, params: params, headers: { 'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.S9r5zXhawjUvyxfpLClFMVLvI7SbBi4CPdVRrc3JjBI" }
    expect(response).to eq(201)
  end

  it "creates orders with invalid token" do
    response = post api_orders_path, params: params, headers: { 'Authorization': "Bearer #{token}" }
    expect(response).to eq(401)
  end

  describe "GET #index" do
    let!(:user) { create(:user) }
    let!(:region) {create(:region)}
    let!(:product) { create(:product, region_id: region.id) }
    let!(:token) {JWT.encode({ user_id: user.id }, 'dfdfdfdfdfdfdf')}

    it "read orders with invalid token" do
      response = get api_orders_path, headers: { 'Authorization': "Bearer #{token}" }
      expect(response).to eq(401)
    end

    it "read orders with valid token" do
      response = get api_orders_path, headers: { 'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.S9r5zXhawjUvyxfpLClFMVLvI7SbBi4CPdVRrc3JjBI" }
      expect(response).to eq(200)
    end

  end

end
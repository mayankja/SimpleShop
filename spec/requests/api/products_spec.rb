require 'rails_helper'

RSpec.describe "Api::Products", type: :request do
  let!(:user) { create(:user) }
  let!(:country_detail) {create(:country_detail)}
  let!(:tax) {create(:tax)}
  let!(:region) {create(:region, country_detail_id: country_detail.id, tax_id: tax.id)}
  # let!(:region) {create(:region)}
  let!(:token) {JWT.encode({ user_id: user.id }, 'dfdfdfdfdfdfdf')}
  let(:param_attrs) do
      {
        "title" => "tshirt",
        "description" => "1xcxdffd",
        "image" => "gffgfdg",
        "price" => "1",
        "sku" => "335sdfds@re",
        "stock_number" => "12",
        "region_id" => region.id
      }
  end
  let(:params) { param_attrs }
  # let!(:params) {title: "utc111",country_detail_id: "1",currency: "usd",tax_id: "1"}
  before do
    allow_any_instance_of(Api::ProductsController).to receive(:current_user) { user }
  end

  it "creates product with valid token" do
    response = post api_products_path, params:{product: params}, headers: { 'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.S9r5zXhawjUvyxfpLClFMVLvI7SbBi4CPdVRrc3JjBI" }
    expect(response).to eq(201)
  end

  it "creates product with invalid token" do
    response = post api_products_path, params:{product: params}, headers: { 'Authorization': "Bearer #{token}" }
    expect(response).to eq(401)
  end

  describe "PUT #update" do
    let!(:user) { create(:user) }
    let!(:country_detail) {create(:country_detail)}
    let!(:tax) {create(:tax)}
    let!(:region) {create(:region, country_detail_id: country_detail.id, tax_id: tax.id)}
    let!(:product) { create(:product, region_id: region.id) }
    let!(:token) {JWT.encode({ user_id: user.id }, 'dfdfdfdfdfdfdf')}

    it "update product with invalid token" do
      response = put api_product_path(product.id), params:{product: params}, headers: { 'Authorization': "Bearer #{token}" }
      expect(response).to eq(401)
    end

    it "update product  with valid token" do
      response = put api_product_path(product.id), params:{product: params} ,headers: { 'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.S9r5zXhawjUvyxfpLClFMVLvI7SbBi4CPdVRrc3JjBI" }
      expect(response).to eq(200)
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { create(:user) }
    let!(:country_detail) {create(:country_detail)}
    let!(:tax) {create(:tax)}
    let!(:region) {create(:region, country_detail_id: country_detail.id, tax_id: tax.id)}
    let!(:product) { create(:product, region_id: region.id) }
    let!(:token) {JWT.encode({ user_id: user.id }, 'dfdfdfdfdfdfdf')}

    it "destroy product with invalid token" do
      response =  delete "/api/products/#{product.id}", params:{id: product.id}, headers: { 'Authorization': "Bearer #{token}" }
      expect(response).to eq(401)
    end

    it "destroy product  with valid token" do
      response = delete "/api/products/#{product.id}", params:{id: product.id} ,headers: { 'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.S9r5zXhawjUvyxfpLClFMVLvI7SbBi4CPdVRrc3JjBI" }
      expect(response).to eq(200)
    end
  end
end
require 'rails_helper'

RSpec.describe "Api::Regions", type: :request do
  # let!(:user) { User.create(email: "bob@example.com", is_admin: true) }
  let!(:user) { create(:user) }
  let!(:token) {JWT.encode({ user_id: user.id }, 'dfdfdfdfdfdfdf')}
  let!(:tax) { create(:tax) }
  let!(:country_detail) { create(:country_detail) }
  let!(:region) { create(:region, tax_id: tax.id,country_detail_id: country_detail.id) }

  let(:param_attrs) do
      {
        "title" => "xyz",
        "country_detail_id" => country_detail.id,
        "currency" => "USD",
        "tax_id" => tax.id
      }
  end
  let(:params) { param_attrs }
  # let!(:params) {title: "utc111",country_detail_id: "1",currency: "usd",tax_id: "1"}
  before do
    # user = create(:user
    allow_any_instance_of(Api::RegionsController).to receive(:current_user) { user }
  end

  it "creates region with valid token" do
    response = post api_regions_path, params:{region: params}, headers: { 'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.S9r5zXhawjUvyxfpLClFMVLvI7SbBi4CPdVRrc3JjBI" }
    expect(response).to eq(201)
  end

  it "creates region with invalid token" do
    response = post api_regions_path, params:{region: params}, headers: { 'Authorization': "Bearer #{token}" }
    expect(response).to eq(401)
  end

  describe "PUT #update" do
    let!(:user) { create(:user) }
    let!(:country_detail) {create(:country_detail)}
    let!(:tax) {create(:tax)}
    let!(:region) {create(:region, country_detail_id: country_detail.id, tax_id: tax.id)}
    # let!(:product) { create(:product, region_id: region.id) }
    let!(:token) {JWT.encode({ user_id: user.id }, 'dfdfdfdfdfdfdf')}

    it "update region with invalid token" do
      response = put api_region_path(region.id), params:{region: params}, headers: { 'Authorization': "Bearer #{token}" }
      expect(response).to eq(401)
    end

    it "update region  with valid token" do
      response = put api_region_path(region.id), params:{region: params} ,headers: { 'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.S9r5zXhawjUvyxfpLClFMVLvI7SbBi4CPdVRrc3JjBI" }
      expect(response).to eq(200)
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { create(:user) }
    let!(:country_detail) {create(:country_detail)}
    let!(:tax) {create(:tax)}
    let!(:region) {create(:region, country_detail_id: country_detail.id, tax_id: tax.id)}
    # let!(:product) { create(:product, region_id: region.id) }
    let!(:token) {JWT.encode({ user_id: user.id }, 'dfdfdfdfdfdfdf')}

    it "update region with invalid token" do
      response =  delete "/api/regions/#{region.id}", params:{id: region.id}, headers: { 'Authorization': "Bearer #{token}" }
      expect(response).to eq(401)
    end

    it "update region  with valid token" do
      response = delete "/api/regions/#{region.id}", params:{id: region.id} ,headers: { 'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.S9r5zXhawjUvyxfpLClFMVLvI7SbBi4CPdVRrc3JjBI" }
      expect(response).to eq(200)
    end
  end
end
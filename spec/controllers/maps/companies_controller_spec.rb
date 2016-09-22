require 'rails_helper'

RSpec.describe Maps::CompaniesController, type: :controller do
  context "index" do
    it "returns all companies for google geo api graph" do
      get "index"

      expect(assigns(:companies).first).to be_a(Company)

      expect(response).to have_http_status 200
    end
  end
end

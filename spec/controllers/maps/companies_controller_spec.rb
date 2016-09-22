require 'rails_helper'

RSpec.describe Maps::CompaniesController, type: :controller do
  fixtures :users
  context "index" do
    it "returns all companies for google geo api graph" do
      user = User.first
      get "index", {}, { user_id: user.id }

      expect(assigns(:companies).first).to be_a(Company)

      expect(response).to have_http_status 200
    end
  end
end

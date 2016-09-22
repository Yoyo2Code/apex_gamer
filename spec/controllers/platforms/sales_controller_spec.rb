require 'rails_helper'

RSpec.describe Platforms::SalesController, type: :controller do
  fixtures :users
  context "index" do
    it "returns all platforms for sales graph" do
      user = User.first
      get "index", {}, { user_id: user.id }

      expect(assigns(:platforms).first).to be_a(Platform)

      expect(response).to have_http_status 200
    end
  end
end

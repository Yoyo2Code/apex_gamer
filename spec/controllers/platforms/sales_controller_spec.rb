require 'rails_helper'

RSpec.describe Platforms::SalesController, type: :controller do
  context "index" do
    it "returns all platforms for sales graph" do
      get "index"

      expect(assigns(:platforms).first).to be_a(Platform)

      expect(response).to have_http_status 200
    end
  end
end

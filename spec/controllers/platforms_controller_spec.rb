require 'rails_helper'

RSpec.describe PlatformsController, type: :controller do
  context "index action" do
    it "only renders index view" do
      get 'index'

      expect(response).to have_http_status(200)
    end
  end
end

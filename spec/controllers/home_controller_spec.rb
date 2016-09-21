require 'rails_helper'

describe HomeController, type: :controller do
  context "show" do
    it "displays homepage" do
      get 'show'

      expect(response).to have_http_status(200)
    end
  end
end

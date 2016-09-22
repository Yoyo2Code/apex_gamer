require 'rails_helper'

describe HomeController, type: :controller do
  fixtures :users
  context "show action" do
    it "displays homepage" do
      user = User.first

      get 'show', {}, { user_id: user.id }

      expect(response).to have_http_status(200)
    end
  end
end

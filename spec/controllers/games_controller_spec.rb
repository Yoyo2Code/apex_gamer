require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  fixtures :users
  context "index action" do
    it "only renders index view" do
      user = User.first
      
      get 'index', {}, { user_id: user.id }

      expect(response).to have_http_status(200)
    end
  end
end

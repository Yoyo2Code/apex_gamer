require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  fixtures :users

  context "create" do
    xit "creates a session" do
      user = User.first

      get 'create', {}
    end
  end

  context "destroy" do
    it "clears sessions" do
      user = User.first
      get 'destroy', {}, { user_id: user.id }

      session = controller.session[:user_id]
      expect(session).to eq (nil)
    end
  end
end

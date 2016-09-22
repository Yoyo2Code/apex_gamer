require 'rails_helper'

describe DataController, type: :controller do
  fixtures :users

  context "index" do
    it "searches api to update data" do
      user = User.first

      get 'index', {}, { user_id: user.id }

      expect(response).to redirect_to(root_path)
      flash_message = controller.flash

      expect(flash_message).to include(["success", "Now Searching for New Data"])
    end
  end
end

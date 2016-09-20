require 'rails_helper'

describe HomeController, type: :controller do
  it "displays homepage" do
    get 'index'

    expect(response).to eq(200)
  end
end

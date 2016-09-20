require 'rails_helper'

RSpec.feature "User can see all game genres" do
  xit "can display game genres" do
    visit "/maps/companies"

    expect(page).to have_css("#map")
    expect(page).to have_content("Ever Wondered What Countries Have the Most Gaming Companies?")
  end
end

require 'rails_helper'

RSpec.describe Maps::CompaniesController, type: :controller do
  it "returns companies with numbers it appears" do
    VCR.use_cassette("companies_count") do
    get "show"

    expect(response).to have_http_status 200
    end
  end
end

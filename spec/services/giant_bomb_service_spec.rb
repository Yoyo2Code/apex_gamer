require 'rails_helper'

describe GiantBombService do
  context "#companies_with_country" do
    it "can find companies and their country of origin" do
      VCR.use_cassette("companies_with_country") do
        companies = GiantBombService.new.companies_with_country
        company = companies.first
        expect(company["location_country"]).to eq "USA"
      end
    end
  end
end

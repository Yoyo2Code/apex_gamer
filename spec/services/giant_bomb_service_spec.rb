require 'rails_helper'

describe GiantBombService do
  context "it is initialized with default url" do
    it "has a default of 'giantbomb/api'" do
      gbs     = GiantBombService.new
      service = gbs.connection.headers["User-Agent"]
      expect(service).to eq("Faraday v0.9.2")
    end
  end

  context "#companies_with_country" do
    it "can find companies and their country of origin" do
      VCR.use_cassette("companies_with_country") do
        companies = GiantBombService.new.companies_with_country
        company   = companies.first

        expect(company["location_country"]).to eq "USA"
      end
    end
  end

  context "#parse_results" do
    it "grabs results and traslates from JSON" do
      data = '"results":[{"location_country":"USA"},{"location_country":"UK"}]'

      parsed_data = GiantBombService.new.parse_results(data)

      result = ''
      expect(parsed_data).to eq(result)
    end
  end
end

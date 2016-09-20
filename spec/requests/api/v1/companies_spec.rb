require 'rails_helper'

describe "Companies Endpoint" do
  fixtures :companies
    it 'sends all companies' do
      first_company = Company.first

      get '/api/v1/companies'
      expect(response).to be_success

      json = JSON.parse(response.body)

      found_company = json.find { |company| company["name"] == first_company.name }

      expect(found_company["name"]).to eq(first_company.name)
      expect(found_company["location_country"]).to eq(first_company.location_country)
      # expect(found_company["date_founded"]).to eq(first_company.date_founded)
    end
end

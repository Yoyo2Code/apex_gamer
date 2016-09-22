require 'rails_helper'

describe "Company" do
  fixtures :companies

  context ".known_dates_founded" do
    it "returns companies with valid dates founded" do
      invalid_company = Company.find_by(date_founded: nil)

      expect(Company.all.count).to eq 6

      expect(Company.known_dates_founded.count).to eq 5

      expect(Company.known_dates_founded).to_not include(invalid_company)
    end
  end

  context ".valid_companies" do
    it "returns companies with valid dates founded and locations" do
      invalid_company_date = Company.find_by(date_founded: nil)
      invalid_company_country = Company.find_by(location_country: nil)

      expect(Company.all.count).to eq 6

      expect(Company.valid_companies.count).to eq 4

      expect(Company.valid_companies).to_not include(invalid_company_date)
      expect(Company.valid_companies).to_not include(invalid_company_country)
    end
  end

  context ".top_five_newest_companies" do
    it "returns top five valid companies" do
      invalid_company_date = Company.find_by(date_founded: nil)
      invalid_company_country = Company.find_by(location_country: nil)

      expect(Company.all.count).to eq 6

      expect(Company.valid_companies.count).to eq 4

      expect(Company.top_five_newest_companies).to_not include(invalid_company_date)
      expect(Company.top_five_newest_companies).to_not include(invalid_company_country)
    end
  end
end

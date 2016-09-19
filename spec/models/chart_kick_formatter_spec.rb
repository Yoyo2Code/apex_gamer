require 'rails_helper'

RSpec.describe ChartKickFormatter, type: :model do
  context ".companies_with_country" do
    it "formats countries" do

      data = [{ "location_country"=>"USA" },
              { "location_country"=>"USA" },
              { "location_country"=>"United Kingdom" },
              {"location_country"=>nil}]

      countries = ChartKickFormatter.companies_with_country(data)

      result = { "USA"            => 2,
                 "United Kingdom" => 1}

      expect(countries).to eq(result)
    end
  end
end

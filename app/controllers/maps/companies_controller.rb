class Maps::CompaniesController < ApplicationController
  def show
    #########################
        companies_by_country = Faraday.get("http://www.giantbomb.com/api/companies/?api_key=c66585c2f638b4f9cb135c0dc661624ce51125cb&format=json&filter=location_country&field_list=location_country")
        data = JSON.parse(companies_by_country.body)["results"]

        result = data.each_with_object(Hash.new(0)) { |country,counts| counts[country["location_country"]] += 1 }
        result.delete(nil)
        @companies = result
    #########################
  end

end

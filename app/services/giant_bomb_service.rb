class GiantBombService
  # attr_reader :connection

  def initialize
    @api_connection = Faraday.new(:url => 'http://www.giantbomb.com/api/') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def load_companies
    companies_with_country = @api_connection.get("companies/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&filter=location_country&field_list=location_country,name,date_founded")
    data = parse_results(companies_with_country.body)

    offset ||= increment_offset(data["offset"])

    number_of_page_results ||= data["number_of_page_results"]

    until offset == number_of_page_results
      response = @api_connection.get("companies/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&filter=location_country&field_list=location_country,name,date_founded&offset=#{offset}")
      data = parse_results(response.body)
      CompanyDataSaver.save_companies(data["results"])

      offset = increment_offset(data["offset"])
    end
  end

  def increment_offset(offset)
    offset.to_i + 1
  end

  def parse_results(results)
    JSON.parse(results)
  end
end

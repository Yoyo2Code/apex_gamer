class GiantBombService
  def initialize
    @connection = Faraday.new(:url => 'http://www.giantbomb.com/api/') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def companies_with_country
    companies_with_country = @connection.get("companies/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&filter=location_country&field_list=location_country")
    parse_results(companies_with_country.body)
  end

  def parse_results(results)
    JSON.parse(results)["results"]
  end
end

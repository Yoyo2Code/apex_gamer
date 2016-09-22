class GiantBombService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => 'http://www.giantbomb.com/api/') do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter
    end
  end

  def load_companies
    companies_with_country = connection.get("companies/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&filter=location_country&field_list=location_country,name,date_founded")
    data     = parse_results(companies_with_country.body)
    offset   = increment_offset(data["offset"])
    number_of_page_results ||= data["number_of_page_results"]

    companies = []
    until offset == number_of_page_results
      response = connection.get("companies/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&filter=location_country&field_list=location_country,name,date_founded&offset=#{offset}")
      data     = parse_results(response.body)
      companies << data["results"]
      offset  += 1
    end
    companies.flatten
  end

  def load_platforms
    response = connection.get("platforms/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&field_list=name,original_price,install_base,release_date")
    data     = parse_results(response.body)
    offset ||= increment_offset(data["offset"])
    number_of_page_results ||= data["number_of_page_results"]

    platforms = []
    until offset == number_of_page_results
      response = connection.get("platforms/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&field_list=name,original_price,install_base,release_date")
      data     = parse_results(response.body)
      platforms << data["results"]
      offset  += 1
    end
    platforms.flatten
  end

  def load_games
    upcoming_games_by_month = connection.get("games/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&field_list=name,original_release_date,site_detail_url")
    data       = parse_results(upcoming_games_by_month.body)
    offset   ||= increment_offset(data["offset"])
    number_of_page_results ||= data["number_of_page_results"]

    games = []
    until offset == number_of_page_results
      response   = connection.get("games/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&field_list=name,original_release_date,site_detail_url&offset=#{offset}")
      data       = parse_results(response.body)
      games << data["results"]
      offset  += 1
    end
    games.flatten
  end

  def increment_offset(offset)
    offset.to_i + 1
  end

  def parse_results(results)
    JSON.parse(results)
  end
end

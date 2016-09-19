class HomeController < ApplicationController

  def show
     # genres = Faraday.get("http://www.giantbomb.com/api/genres/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&filter=&field_list=name")

################################################# ???? Date filtering to show upcoming games
    #games_by_release_date = Faraday.get("http://www.giantbomb.com/api/releases/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&field_list=release_date,platform")
    # data = JSON.parse(games_by_release_date.body)["results"]
    # byebug
################################################## ?????? Date filtering to show upcoming games

    # upcoming_games_by_month = Faraday.get("http://www.giantbomb.com/api/games/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&filter=original_release_date&field_list=expected_release_month,name")
    # data = JSON.parse(upcoming_games_by_month.body)["results"]

#########################
    # companies_with_dates_founded = Faraday.get("http://www.giantbomb.com/api/companies/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&field_list=date_founded,name")
    # data = JSON.parse(companies_with_dates_founded.body)["results"]
    #   companies = data.each do |company|
    #     OpenStruct.new(company)
    #   end
#########################

#########################
    # most_common_platforms = Faraday.get("http://www.giantbomb.com/api/games/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&field_list=platforms")
    # data = JSON.parse(most_common_platforms.body)["results"]
    # platform_list = data.map do |platform|
    #   platform["platforms"].map do |platform|
    #     OpenStruct.new({name: platform["name"], site_url: platform["site_detail_url"] })
    #   end
    # end.flatten
    # result = platform_list.each_with_object(Hash.new(0)) { |country,counts| counts[country.name] += 1 }
#########################

#########################
    # platforms_and_sales = Faraday.get("http://www.giantbomb.com/api/platforms/?api_key=#{ENV['GIANTBOMB_API_KEY']}&format=json&field_list=name,original_price,install_base")
    #
    # data = JSON.parse(platforms_and_sales.body)["results"]
    # platforms = data.map do |platform_data|
    #   OpenStruct.new(platform_data)
    # end
    #
    # p = platforms.map do |platform|
    #   {platform.name => (platform.install_base.to_i * platform.original_price.to_i) }
    # end
#########################
  end
end

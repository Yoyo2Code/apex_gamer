class DataSaver
  attr_reader :giantbomb_service

  def initialize
    @giantbomb_service ||= GiantBombService.new
  end

  def save_companies
    giantbomb_service.load_companies.each do |company|
      Company.find_or_create_by(company)
    end
  end

  def save_platforms
    giantbomb_service.load_platforms.each do |platform|
      base         = platform["install_base"].to_i
      price        = platform["original_price"].to_f
      name         = platform["name"]
      release_date = platform["release_date"]


      Platform.find_or_create_by(
        name: name,
        install_base: base,
        original_price: price,
        release_date: release_date
      )
    end
  end

  def save_games
    giantbomb_service.load_games.each do |game_data|
      Game.find_or_create_by(game_data)
    end
  end
end

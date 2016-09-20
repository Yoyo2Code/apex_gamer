class DataSaver

  def self.save_companies(companies)
    companies.each do |company|
      Company.find_or_create_by(company)
    end
  end

  def self.save_platforms(platforms)
    platforms.each do |platform|
      base  = platform["install_base"].to_i
      price = platform["original_price"].to_f
      name  = platform["name"]

      Platform.find_or_create_by(
        name: name,
        install_base: base,
        original_price: price
      )
    end
  end

  def self.save_games(games)
    games.each do |game_data|
      Game.find_or_create_by(game_data)
    end
  end
end

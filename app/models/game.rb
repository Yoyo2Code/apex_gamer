class Game < ApplicationRecord

  def self.valid_games
    self.where.not(date_founded: nil)
  end

  def self.top_ten_newest_games
    valid_games.order(:original_release_date).last(10)
  end
end

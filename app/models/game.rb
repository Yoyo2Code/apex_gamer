class Game < ApplicationRecord

  def self.valid_games
    self.where.not(name: nil).where.not(original_release_date: nil)
  end

  def self.top_five_newest_games
    valid_games.order(:original_release_date).last(5)
  end
end

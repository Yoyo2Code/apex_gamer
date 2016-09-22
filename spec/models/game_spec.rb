require 'rails_helper'

describe "game" do
  fixtures :games
  context ".valid_games" do
    it "returns all valid games" do
      invalid_game = Game.find_by(original_release_date: nil)

      expect(Game.all.count).to eq 6

      expect(Game.valid_games.count).to eq 5
      expect(Game.valid_games).to_not include(invalid_game)
    end

  end

  context ".top_five_newest_games" do
    it "returns top five newest valid games" do
      invalid_game = Game.find_by(original_release_date: nil)

      expect(Game.all.count).to eq 6
      expect(Game.all).to include(invalid_game)

      valid_games = Game.top_five_newest_games

      expect(valid_games.count).to eq 5
      expect(valid_games).to_not include(invalid_game)
    end
  end
end

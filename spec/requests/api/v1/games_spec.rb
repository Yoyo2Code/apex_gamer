require 'rails_helper'

describe "Games Endpoint" do
  fixtures :games
    it 'sends all games' do
      first_game = Game.first

      get '/api/v1/games'
      expect(response).to be_success

      json = JSON.parse(response.body)

      found_game = json.find { |game| game["name"] == first_game.name }

      expect(found_game["name"]).to eq(first_game.name)
      # expect(found_game["original_release_date"]).to eq(first_game.original_release_date)
      expect(found_game["site_detail_url"]).to eq(first_game.site_detail_url)
    end
end

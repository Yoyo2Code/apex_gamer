class GamesController < ApplicationController
  def index
    GiantBombService.new.load_games
  end
end

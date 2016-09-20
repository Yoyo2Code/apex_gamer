class LoadGamesWorker
  include Sidekiq::Worker
  
  def perform
    GiantBombService.new.load_games
  end
end

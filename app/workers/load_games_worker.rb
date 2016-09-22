class LoadGamesWorker
  include Sidekiq::Worker

  def perform
    DataSaver.save_games
  end
end

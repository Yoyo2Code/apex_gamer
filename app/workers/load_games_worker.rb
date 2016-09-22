class LoadGamesWorker
  include Sidekiq::Worker

  def perform
    DataSaver.new.save_games
  end
end

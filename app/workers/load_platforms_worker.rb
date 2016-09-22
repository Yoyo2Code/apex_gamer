class LoadPlatformsWorker
  include Sidekiq::Worker

  def perform
    DataSaver.save_platforms
  end
end

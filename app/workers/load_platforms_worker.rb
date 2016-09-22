class LoadPlatformsWorker
  include Sidekiq::Worker

  def perform
    DataSaver.new.save_platforms
  end
end

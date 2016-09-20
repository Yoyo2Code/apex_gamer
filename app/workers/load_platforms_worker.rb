class LoadPlatformsWorker
  include Sidekiq::Worker

  def perform
    GiantBombService.new.load_platforms
  end
end

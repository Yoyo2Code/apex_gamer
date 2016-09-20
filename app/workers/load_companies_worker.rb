class LoadCompaniesWorker
  include Sidekiq::Worker

  def perform
    GiantBombService.new.load_companies
  end
end

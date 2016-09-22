class LoadCompaniesWorker
  include Sidekiq::Worker

  def perform
    DataSaver.save_companies
  end
end

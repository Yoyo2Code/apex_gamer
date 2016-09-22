class LoadCompaniesWorker
  include Sidekiq::Worker

  def perform
    DataSaver.new.save_companies
  end
end

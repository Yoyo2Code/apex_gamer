class Maps::CompaniesController < ApplicationController
  def index
    @companies = Company.all
    LoadCompaniesWorker.perform_async
  end
end

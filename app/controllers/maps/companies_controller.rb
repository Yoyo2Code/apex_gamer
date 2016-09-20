class Maps::CompaniesController < ApplicationController
  def show
    @companies = Company.all
    LoadCompaniesWorker.perform_async
  end
end

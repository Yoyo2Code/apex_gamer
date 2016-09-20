class Maps::CompaniesController < ApplicationController

  def show
    @companies = Company.all
    CompanyLocationsWorker.perform_async
  end
end

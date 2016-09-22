class Maps::CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
end

class Api::V1::CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
end

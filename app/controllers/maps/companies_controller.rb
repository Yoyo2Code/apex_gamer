class Maps::CompaniesController < ApplicationController
  def show
    data       = GiantBombService.new.companies_with_country
    @companies = ChartKickFormatter.companies_with_country(data)
  end
end

class Company < ApplicationRecord

  def self.known_dates_founded
    self.where.not(date_founded: nil)
  end

  def self.valid_companies
    known_dates_founded.where.not(location_country: nil)
  end

  def self.top_five_newest_companies
    valid_companies.order(:date_founded).last(5)
  end
end

class Company < ApplicationRecord

  def self.valid_companies
    self.where.not(date_founded: nil)
  end

  def self.top_ten_newest_companies
    valid_companies.order(:date_founded).last(10)
  end
end

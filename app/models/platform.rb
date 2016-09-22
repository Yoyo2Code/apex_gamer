class Platform < ApplicationRecord
  before_save :calculate_total_revenue

  def calculate_total_revenue
    self.total_revenue = self.install_base * self.original_price
  end

  def self.valid_platforms
    self.where.not(release_date: nil)
  end

  def self.top_five_newest_platforms
    valid_platforms.order(:release_date).last(5)
  end
end

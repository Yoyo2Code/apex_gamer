class Platform < ApplicationRecord
  before_save :calculate_total_revenue

  def calculate_total_revenue
    self.total_revenue = self.install_base * self.original_price
  end
end

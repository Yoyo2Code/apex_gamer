class AddTotalRevenueToPlatform < ActiveRecord::Migration[5.0]
  def change
    add_column :platforms, :total_revenue, :decimal
  end
end

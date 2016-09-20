class AddDateFoundedToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :date_founded, :datetime
  end
end

class AddReleaseDateToPlatforms < ActiveRecord::Migration[5.0]
  def change
    add_column :platforms, :release_date, :datetime
  end
end

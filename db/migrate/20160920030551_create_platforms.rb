class CreatePlatforms < ActiveRecord::Migration[5.0]
  def change
    create_table :platforms do |t|
      t.string :name
      t.decimal :original_price
      t.integer :install_base

      t.timestamps
    end
  end
end

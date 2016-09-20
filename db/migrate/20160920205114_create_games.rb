class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.datetime :original_release_date
      t.string :site_detail_url

      t.timestamps
    end
  end
end

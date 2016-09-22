class AddUriToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uri, :string
  end
end

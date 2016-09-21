class RenameUriFromUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :uri, :uid
  end
end

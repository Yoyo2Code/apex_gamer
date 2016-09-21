class ChangeNicknameFromUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :nickname, :username
  end
end

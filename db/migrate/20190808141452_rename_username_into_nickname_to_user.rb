class RenameUsernameIntoNicknameToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :username, :nickname
    end
  end
end

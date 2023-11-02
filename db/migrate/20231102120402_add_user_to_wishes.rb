class AddUserToWishes < ActiveRecord::Migration[7.1]
  def change
    add_reference :wishes, :user, null: false, foreign_key: true
  end
end

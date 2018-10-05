class AddUserRefToThings < ActiveRecord::Migration[5.1]
  def change
    add_reference :things, :user, foreign_key: true
  end
end

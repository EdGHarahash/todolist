class DropCatUsersTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :categories_users
  end
end

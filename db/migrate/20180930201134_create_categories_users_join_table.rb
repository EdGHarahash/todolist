class CreateCategoriesUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :users do |t|
      t.index :category_id
      t.index :user_id
    end
  end
end

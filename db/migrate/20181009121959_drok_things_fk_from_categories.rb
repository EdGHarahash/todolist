class DrokThingsFkFromCategories < ActiveRecord::Migration[5.1]
  def change
  	remove_foreign_key :categories, :things
  end
end

class DrokThingsFkFromCategoriesColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column :categories, :thing_id
  end
end

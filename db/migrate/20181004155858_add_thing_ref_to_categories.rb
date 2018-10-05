class AddThingRefToCategories < ActiveRecord::Migration[5.1]
  def change
  	add_reference :categories, :thing, foreign_key: true
  end
end

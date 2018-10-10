class DropThenAddFkToLittleThings < ActiveRecord::Migration[5.1]
  def change
  	remove_foreign_key :little_things, :things
    add_foreign_key :little_things, :things, on_delete: :cascade
  end
end

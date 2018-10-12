class DropLittleThingsTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :little_things
  end
end

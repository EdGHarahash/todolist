class AddThingRefToLittleThings < ActiveRecord::Migration[5.1]
  def change
    add_reference :little_things, :thing, foreign_key: true
  end
end

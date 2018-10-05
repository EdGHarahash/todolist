class AddDefaultDoneToLittleThings < ActiveRecord::Migration[5.1]
  def change
    change_column_default :little_things, :done, false
  end
end

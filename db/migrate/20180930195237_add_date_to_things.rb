class AddDateToThings < ActiveRecord::Migration[5.1]
  def change
    add_column :things, :deadline, :date
  end
end

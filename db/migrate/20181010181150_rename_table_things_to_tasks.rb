class RenameTableThingsToTasks < ActiveRecord::Migration[5.1]
  def change
  	rename_table :things, :tasks
  end
end

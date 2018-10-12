class RenameColumnNameToTitleInTasks < ActiveRecord::Migration[5.1]
  def change
  	rename_column :tasks, :name, :title
  end
end

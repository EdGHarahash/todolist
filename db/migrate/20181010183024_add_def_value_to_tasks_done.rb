class AddDefValueToTasksDone < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :tasks, :done, false
  end
end

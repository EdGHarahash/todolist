class AddSelfRefToTasks < ActiveRecord::Migration[5.1]
  def change
  	add_reference :tasks, :task, index: true
  end
end

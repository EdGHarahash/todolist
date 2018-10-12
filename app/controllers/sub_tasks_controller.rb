class SubTasksController < ApplicationController
  def create
  	@task_params = task_params
    @task = Task.find(@task_params[:id])
    @task_params[:sub_tasks_attributes].each do |st|
      st[:category] = @task.category
    end
    @task.sub_tasks_attributes = @task_params[:sub_tasks_attributes]
      if @task.save
        redirect_to @task, notice: 'Subtask was successfully created.'
      else
        redirect_to @task, notice: 'New subtasks are not valid'  
      end
  end

  def edit
    @st = Task.find(sub_task_params[:id])
    @st.update(sub_task_params)
  end

  def task_params
    params.require(:task).permit(:id, :title,:deadline,
      category_attributes: :name, sub_tasks_attributes: :title)
  end

  def sub_task_params
    params.require(:sub_task).permit(:id, :done)
  end
end

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.where(task_id: nil, user_id: current_user.id)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
      if @task.save
        redirect_to @task, notice: 'Task was successfully created.' 
      else
        render :new
      end
  end

  def destroy
    if @task.user_id = current_user.id
      @task.destroy
      redirect_to tasks_url, notice: 'Task was successfully destroyed.' 
    else
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      @task_params = params.require(:task).permit(:id, :title,:deadline,
       category: :name, sub_tasks_attributes: :title)
      @task_params[:category] = Category.find_or_create_by(name: @task_params[:category][:name], user_id: current_user.id)
      @task_params[:sub_tasks_attributes].each do |st|
        st[:category] = @task_params[:category] 
      end
      @task_params
    end
end

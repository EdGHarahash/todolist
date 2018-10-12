class HomeController < ApplicationController
  def index
  	@categories = Category.where(user_id: current_user.id)
  	@tasks = selected_category_tasks
  	@selected_category = selected_category_name
  	if @selected_category.blank?
  	  @selected_category = "Today"
  	end
  end
  private
    def today_tasks
      Task.where(deadline: Date.today, user_id: current_user.id, task_id: nil)
    end

    def selected_category_tasks
      case selected_category_name
        when "Today"   
          today_tasks
        when "This Week"    
          Task.where(deadline: Date.today..Date.today+7, user_id: current_user.id, task_id: nil)
        else
          category = Category.find_by(name: selected_category_name)
          if category
          	Task.where(category_id: category.id, task_id: nil)
          else
          	today_tasks
          end
       end
    end

    def selected_category_name
      params.permit(:category_name)[:category_name]
    end
end

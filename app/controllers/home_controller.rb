class HomeController < ApplicationController
  def index
  	@categories = Category.all
  	@today_things = today_things
  end
  private
    def today_things
      Thing.where(:deadline => Date.today)
    end
end

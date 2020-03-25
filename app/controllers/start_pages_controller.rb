class StartPagesController < ApplicationController
  def home
    if logged_in?
      #@tasks = current_user.tasks.paginate(page: params[:page])
      @tasks  = Task.order('limit_date').all
      @task = current_user.tasks.build
      @feed_items = current_user.feed.paginate(page: params[:page],per_page: 5)
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end

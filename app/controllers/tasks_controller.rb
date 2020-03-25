class TasksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを作成しました"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @task.destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end
  
  private

    def task_params
      params.require(:task).permit(:content, :state, :limit_date)
    end
    
    def correct_user
      @task = current_user.tasks.find_by(id: params[:id])
      redirect_to root_url if @task.nil?
    end
end

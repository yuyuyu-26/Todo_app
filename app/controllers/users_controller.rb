class UsersController < ApplicationController
  
  before_action :logged_in_user, only: [:edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end
  
  def show
    @user = User.find(params[:id])
    #@tasks  = Task.order('limit_date').all
    @tasks = @user.tasks.paginate(page: params[:page],per_page: 20)
    @status = ['予定', '実施中', '実施済']
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそ"
      redirect_to @user #redirect_to user_url(@user.id)　オブジェクトを一意に表す値(id)を取得しようとする
    else                    
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "編集に成功しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.followings.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  
  
  
  private
   
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
      
      # beforeアクション

    
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end

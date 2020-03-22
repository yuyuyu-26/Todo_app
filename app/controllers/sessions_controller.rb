class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user #user_url(user.id)
    else
      flash.now[:danger] = '無効なメール/パスワードの組み合わせです'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end

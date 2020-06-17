class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
    # byebug
    flash.now[:success] = "Welcome Back #{@user.username.capitalize}!"
    # 
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect_to user_path(user)
    else
      redirect_to '/login'
    end
  end

  def welcome
    @videos = Video.all_videos
  end

  def login
  end

  def page_requires_login
  end

  def destroy
    # byebug
    session.delete :user_id
    redirect_to root_path
  end

  
end

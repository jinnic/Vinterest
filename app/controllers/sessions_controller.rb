class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
    # byebug
    
    
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        flash[:success] = "Welcome Back #{user.username.capitalize}!"
        redirect_to user_path(user.username)
    else
      redirect_to '/login'
    end
  end

  def welcome
    @videos = Video.all_videos
  end

  def login
    render 'login'
  end

  def page_requires_login
    @videos = []
      videos = Video.all
      videos.each do |video|
        if video.user.username == current_user.username || video.board.public 
          @videos << video
        end
      end
      @videos
  end

  def logout
    flash[:notice] = "Succesfully logged out #{current_user.username.capitalize}." 
    session.delete :user_id
    redirect_to root_path
  end

  
end

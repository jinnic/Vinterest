class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
    # byebug
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        # byebug
        session[:username] = user.username
        redirect_to user_path(user.username)
    else
      redirect_to '/login'
    end
  end

  def welcome
    videos = Video.all
    @videos = []
    videos.each do |video|
      if video.board.public
        @videos << video
      end
    end
    @videos
  end

  def login
  end

  def page_requires_login
  end

  def destroy
    # byebug
    session.delete :username

    # redirect_to root_path
  end

  
end

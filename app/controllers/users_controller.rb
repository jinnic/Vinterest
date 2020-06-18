class UsersController < ApplicationController
  # validates :email, presence: true 
  skip_before_action :authorized, only: [:new, :create]


  def index
    @users = User.all
  end

  def new
    @user = User.new
    # @user = @user.user.build
  end

  def create
    user = User.create(user_params(:email, :password, :profile, :username))
    session[:user_id] = user.id
    redirect_to '/welcome'
    # user = @user.users.build(user_params(:description))
    # user = User.create(user_params(:email, :password, :profile, :username))
    # redirect_to user_path(user)
  end

  def show
    @user = current_user 
    @videos = user_video
    
    # @user = User.find_by(id: params[:username])
    # @user = User.find_by(username: params[:username])
  end

  def edit
    
    @user = current_user
    # byebug
  end

  def update
    # byebug
    
    user = User.find_by(id: params[:id])
    user.update(user_params(:email, :password, :profile, :username))

    flash[:notice] = "Succesfully updated #{user.username.capitalize}'s profile!" 
    redirect_to user_path(username: user.username)
  end

  def destroy
    byebug
    user = User.find_by(id: params[:id])
    # user = User.find_by(username: params[:username])
    user.destroy
    redirect_to users_path
  end

  private

  def user_params(*arg)
    params.require(:user).permit(arg)
  end

  def user_video
    @videos = []
    videos = Video.all
    videos.each do |video|
      if video.user.username == current_user.username || video.board.public 
        @videos << video
      end
    end
    @videos
  end
end

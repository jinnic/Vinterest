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
    session[:username] = user.username
    redirect_to '/welcome'
    # user = @user.users.build(user_params(:description))
    # user = User.create(user_params(:email, :password, :profile, :username))
    # redirect_to user_path(user)
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def edit
    # byebug
    @user = User.find_by(username: params[:username])
  end

  def update
    # byebug
    user = User.find_by(username: params[:username])
    user.update(user_params(:email, :password, :profile, :username))
    redirect_to user_path(user)
  end

  def destroy
    user = User.find_by(username: params[:username])
    user.destroy
    redirect_to users_path
  end

  private

  def user_params(*arg)
    params.require(:user).permit(arg)
  end
end

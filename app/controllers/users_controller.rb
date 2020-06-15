class UsersController < ApplicationController
  # validates :email, presence: true 

  def index
    @users = User.all
  end

  def new
    @user = User.new
    # @user = @user.user.build
  end

  def create
    # user = @user.users.build(user_params(:description))
    user = User.create(user_params(:email, :password, :profile))
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # byebug
    user = User.find(params[:id])
    user.update(user_params(:email, :password, :profile))
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end

  private

  def user_params(*arg)
    params.require(:user).permit(arg)
  end
end

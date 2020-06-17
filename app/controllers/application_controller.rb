class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user, :logged_in?
  add_flash_types :info, :error, :warning

  def current_user
    #  byebug
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !current_user.nil?  
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin?, :logged_in?, :creator?

  def current_user
    user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def creator?(user)
    current_user == user
  end

end

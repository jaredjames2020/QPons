class ApplicationController < ActionController::Base

  def require_login
    redirect_to root_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def log_in(user)
    session[:user_id] = user.id
  end

end

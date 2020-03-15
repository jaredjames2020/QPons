class ApplicationController < ActionController::Base

<<<<<<< HEAD
  def welcome
  end

=======
>>>>>>> c78c9f78466cfbffac33f01064e6c34a90096c33
  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to travels_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def log_in(user)
    session[:user_id] = user.id
  end

end

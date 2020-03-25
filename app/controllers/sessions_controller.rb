class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to travels_path
    else
      @error = "Please try again"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to travels_path
  end

end

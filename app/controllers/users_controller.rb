class UsersController < ApplicationController

  def new
    @user = User.new
    @user.companies.build.offers.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      log_in(@user)
      redirect_to travels_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :companies_attributes => [:name, :location, :category], :offers_attributes => [:description])
  end

end

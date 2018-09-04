class UsersController < ApplicationController

  def home
    if session[:user_id]
      redirect_to user_showings_path(User.find(session[:user_id]))
  end
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
      if @user.save
      flash[:success] = "Successfully Registered!"
      session[:user_id] = @user.id
      redirect_to user_showings_path(@user)
      else
      render :new
    end

  end











  private
  def user_params
    params.require(:user).permit(:username,:password,:email,:age, :password_confirmation)
  end


end

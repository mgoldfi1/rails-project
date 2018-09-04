class UsersController < ApplicationController

  def home
  end

  def new

  end

  def create
    # binding.pry
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_showings_path(@user)
    else
      render :new
    end
  end

  









  private
  def user_params
    params.require(:user).permit(:username,:password,:email,:age)
  end


end

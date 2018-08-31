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
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # binding.pry
    if session[:user_id] == @user.id
      render :show
    else
      redirect_to root_path
    end
  end









  private
  def user_params
    params.require(:user).permit(:username,:password,:email,:age)
  end


end

class ShowingsController < ApplicationController


  def index
    @user = User.find(params[:user_id])
    # binding.pry
    if session[:user_id] == @user.id
      render :index
    else
      redirect_to root_path
    end
  end



  def new
    @user = User.find(params[:user_id])
  end
end

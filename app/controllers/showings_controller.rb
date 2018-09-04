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
    @user = User.find(session[:user_id])
  end


  def buy
    user = User.find(session[:user_id])
    ticket = Ticket.new(user_id: session[:user_id], showing_id: params[:show_id])
    flash[:notice] = ticket.buyticket
    flash[:success] = flash[:notice] if flash[:notice] == "Success"
    redirect_to user_showings_path(user)
  end

end

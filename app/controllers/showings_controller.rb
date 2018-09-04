class ShowingsController < ApplicationController
  protect_from_forgery with: :exception


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

  def cancel
    ticket = Ticket.find(params[:ticket_id])
    showing = ticket.showing
    user = ticket.user
      if showing.time.to_i > Time.now.to_i
        user.money = user.money + showing.cost
        user.save(validate: false)
        ticket.delete
        flash[:success] = "Successfully Refunded."
      else
        flash[:notice] = "You cannot refund a ticket that has already expired!"
      end
      redirect_to user_showings_path(user)
  end

end

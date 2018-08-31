class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_or_create_by(email: auth['email'])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def login
    @user = User.find_by(name: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
    end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

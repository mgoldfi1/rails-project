class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: auth[:info][:email], age: 17)

    if @user
      session[:user_id] = @user.id
      redirect_to user_showings_path(@user)
    else
    @user = User.new(email: auth[:info][:email], username: auth[:info][:name], age: 17)
    @user.save(validate: false)
    session[:user_id] = @user.id
    redirect_to user_showings_path(@user)
    end
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_showings_path(@user)
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

class SessionsController < ApplicationController
  
  def new
  
  end
  
  def create
    email = params[:sessions][:email].downcase
    password = params[:sessions][:password]
    user = User.find_by(email: email)
    if login(email, password)
      flash[:success] = "Hi! You has successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There was something wrong with your login infomation"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end
  
  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
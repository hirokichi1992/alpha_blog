class ApplicationController < ActionController::Base
  
  config.time_zone = 'Tokyo'
  
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger]="You must be logged in to perform action"
      redirect_to root_path
    end
  end
  
end

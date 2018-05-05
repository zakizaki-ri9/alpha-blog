class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # if session[:user_id]の判定結果が返却される
    # !! はBool値を返却させるための処置
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "Yout must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def current_user
    return nil if session[:session_token].nil?
    user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_logged_in
    unless logged_in?
      flash[:errors] = ['You must be logged in']
      redirect_to new_session_url
    end
  end

  def require_logged_out
    if logged_in?
      flash[:errors] = ['You are already logged in!']
      redirect user_url(current_user)
    end
  end

  def require_current_user
    unless session[:session_token] == current_user.session_token
      flash.now[:errors] = ['You cannot do this!']
      redirect_to user_goals_url(current_user)
    end
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    # User.find(session[:user_id]) if session[:user_id]
    # require 'pry'; binding.pry
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

class SessionsController < ApplicationController
  def new
    redirect_to dashboard_user_path(current_user), notice: 'Your already logged in' if current_user
  end

  def create
    found_user = User.find_by(email: params[:email].downcase)
    if found_user && found_user.authenticate(params[:password])
      session[:user_id] = found_user.id
      flash[:success] = "Welcome, #{found_user.username}!"
      redirect_to dashboard_user_path(found_user)
    else
      flash[:failure] = "Credentials were bad. Try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You've been logged out"
  end
end

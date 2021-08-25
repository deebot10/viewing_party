class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    session[:user_id] = new_user.id
    flash[:success] = "Welcome, #{new_user.username}!"
    redirect_to dashboard_user_path(new_user)
  end

  def dashboard
    @user = User.find(params[:id])
    # @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

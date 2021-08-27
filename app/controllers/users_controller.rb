class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Sign-up Successful!"
      redirect_to dashboard_user_path(new_user)
    else
      flash[:failure] = 'Something went horribly wrong!'
      render :new
    end
  end

  def dashboard
    @user = User.find(params[:id])
    # require "pry"; binding.pry
  end


  private

  def user_params
    # require 'pry'; binding.pry
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end

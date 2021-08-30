class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend && assess_friendship(friend) == false
      Friendship.create(user_id: current_user.id, friend: friend)
      flash[:success] = 'Friend successfully added!'
    else
      flash[:error] = "I'm sorry your friend cannot be found!"
    end
    redirect_to dashboard_user_path(current_user)
  end

  private

  def assess_friendship(friend)
    friend.id == current_user.id || current_user.friends.include?(friend)
  end
end

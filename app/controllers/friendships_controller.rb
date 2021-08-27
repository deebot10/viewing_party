class FriendshipsController < ApplicationController

  def create
    friend = User.find_by(email: params[:email])
    if friend.present? || assess_friendship(friend) == false
      Friendship.create(user_id: params[:user_id], friend: friend)
      flash[:success] = 'Friend successfully added!'
    else
      flash[:error] = 'Unable to add friend'
    end
    redirect_to '/dashboard'
  end

  private

  def assess_friendship(friend)
    friend.id = current_user.id || current_user.friends.include?(friend)
  end
end

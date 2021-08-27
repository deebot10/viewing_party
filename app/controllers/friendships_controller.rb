class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend.present?
      Friendship.create(user_id: params[:user_id], friend: friend)
      flash[:success] = 'Friend successfully added!'
    else
      flash[:error] = 'Unable to add friend'
    end
    redirect_to '/dashboard'
  end

  private

  def access_friendship(friend)
    if friend.id = current_user.id && current_user.friends.include?(friend)
    flash[:error] = 'Unable to add Friend'
  end
end

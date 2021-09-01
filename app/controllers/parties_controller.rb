class PartiesController < ApplicationController
  def new; end

  def create
    party = Party.new(party_params)
    movie = MovieFacade.new.create_movie(params[:movie_id])
    if party.save
      redirect_to dashboard_user_path(current_user)
      invite_guests(party)
    else
      flash[:error] = 'Fields Missing'
      redirect_to user_parties_new_path(current_user)
    end
  end

  def invite_guests(party)
    current_user.friends.map do |friend|
      Invitation.create!(user_id: friend.id, party_id: party.id) if params.keys.include?(friend.username)
    end
  end

  private

  def party_params
    params.permit(:start_time, :duration, :date, :movie_id, :user_id, :title)
  end
end

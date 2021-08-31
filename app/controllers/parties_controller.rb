class PartiesController < ApplicationController
  def new
    # @friends = current_user.friends
    # @movie = MovieFacade.new.create_movie(params[:movie_id])
  end

  def create
    # require 'pry'; binding.pry
    party = Party.new(party_params)
    movie = MovieFacade.new.create_movie(params[:movie_id])
    # require 'pry'; binding.pry
    if party.save
      redirect_to dashboard_user_path(current_user)      
    else  
      flash[:error] = 'Fields missing'
      redirect_to user_parties_new_path(current_user)  
    end
  end

  # <%= f.collection_check_boxes(:friend,current_user.followed_users, :follower_id, :find_email) %>

  private

  def party_params
    params.permit(:start_time, :duration, :date, :movie_id, :user_id)  
  end
end
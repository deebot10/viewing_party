class PartiesController < ApplicationController
  def new
    @friends = current_user.friends
    @movie = MovieFacade.new.create_movie(params[:movie_id])
  end

  def create
    party = Party.create(party_params)
    movie = MovieFacade.new.create_movie(params[:movie_id])
    if party.save
      redirect_to dashboard_user_path(current_user)      
    else  
      flash[:error] = 'Fields missing'
      redirect_to  
    end
  end

  private

  def party_params
    params.permit(:start_time, :duration, :date, :movie_id, :user_id)  
  end
end
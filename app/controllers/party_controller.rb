class PartyController < ApplicationController
  def new
    @friends = current_user.friends
    # require 'pry'; binding.pry  
    @movie = MovieFacade.new.create_movie(params[:movie_id])
  end

  def create
    
  end
end
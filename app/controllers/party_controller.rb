class PartyController < ApplicationController
  def new
    @friends = current_user.friends
    @movie = MovieFacade.new.create_movie(params[:movie_id])
    # require 'pry'; binding.pry  
  end

  def create
    
  end
end
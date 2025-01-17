class MoviesController < ApplicationController
  def index
    if params[:top_movies]
      @top_movies = MovieService.new.top_40_movies
    elsif params[:search]
      @search_movies = MovieService.new.movie_search(params[:search])
    end
  end

  def show
    @movie = MovieFacade.new.create_movie(params[:id])
  end
end

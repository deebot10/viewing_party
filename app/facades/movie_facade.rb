class MovieFacade
  attr_reader :service

  def initialize
    @service = MovieService.new
  end

  def cast_info(id)
    cast = @service.list_cast_members(id)
    cast.map do |hash|
      { name: hash[:name], character: hash[:character] }
    end
  end

  def review_info(id)
    reviews = @service.list_reviews(id)
    reviews.map do |hash|
      { author: hash[:author], review: hash[:content] }
    end
  end

  def movie_details(id)
    json = @service.get_movie(id)
    {
      original_title: json[:original_title],
      overview: json[:overview],
      vote_average: json[:vote_average],
      genres: json[:genres].map { |genre| genre[:name] },
      cast: cast_info(id),
      reviews: review_info(id),
      runtime: json[:runtime],
      id: json[:id],
      image_url: "https://image.tmdb.org/t/p/w500#{json[:poster_path]}"
    }
  end

  def create_movie(id)
    Movie.new(movie_details(id))
  end
end

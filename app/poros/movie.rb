class Movie
  attr_reader :id,
              :title,
              :description,
              :rating,
              :runtime,
              :genres,
              :cast,
              :reviews

  def initialize(info)
    @id = info[:id]
    @title = info[:original_title]
    @description = info[:overview]
    @rating = info[:vote_average]
    @runtime = info[:runtime]
    @genres = info[:genres]
    @cast = info[:cast]
    @reviews = info[:reviews]
  end
end

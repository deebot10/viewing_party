class Movie
  attr_reader :id, :title, :description, :rating, :runtime

  def initialize(info)
    @id = info[:id]
    @title = info[:original_title]
    @description = info[:overview]
    @rating = info[:vote_average]
    @runtime = info[:runtime]
  end
end

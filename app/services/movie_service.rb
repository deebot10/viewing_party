class MovieService < ApiService

  def get_movie(movie_id)
    response = parse_data("https://api.themoviedb.org/3/movie/#{movie_id}").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    parse_json(response)
  end

  def list_popular_movies(page)
    response = parse_data("https://api.themoviedb.org/3/movie/top_rated").get do |f|
      f.params['api_key'] = ENV['movie_key']
      f.params['original_language'] = 'en'
      f.params['page'] = page
    end
    parse_json(response)[:results]
  end

  def movie_search(search)
    response = parse_data("https://api.themoviedb.org/3/search/movie").get do |f|
      f.params['api_key'] = ENV['movie_key']
      f.params['original_language'] = 'en'
      f.params['include_adult'] = false
      f.params['page'] = 1
      f.params['query'] = search
    end
    parse_json(response)[:results]
  end

  def list_cast_members(movie_id)
    response = parse_data("https://api.themoviedb.org/3/movie/#{movie_id}/credits").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    json = parse_json(response)[:cast][0..9]
  end

  def list_reviews(movie_id)
    response = parse_data("https://api.themoviedb.org/3/movie/#{movie_id}/reviews").get do |f|
      f.params['api_key'] = ENV['movie_key']
    end
    json = parse_json(response)[:results]
  end

  def top_40_movies
    list_popular_movies('1') + list_popular_movies('2')
  end
end

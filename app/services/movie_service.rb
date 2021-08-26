class MovieService < ApiService

 def list_popular_movies(page)
   response = parse_data("https://api.themoviedb.org/3/movie/top_rated").get do |f|
     f.params['api_key'] = ENV['movie_key']
     f.params['language'] = 'en'
     f.params['include_adult'] = false
     f.params['page'] = page
   end
   parse_json(response)    
  require 'pry'; binding.pry  
 end      

 def list_movie_search(title, page)
   response = parse_data("https://api.themoviedb.org/3/movie").get do |f|
     f.params['api_key'] = ENV['movie_key']
     f.params['language'] = 'en'
     f.params['include_adult'] = false
     f.params['page'] = page
     f.params['query'] = title
   end
   parse_json(response)      
 end      
end
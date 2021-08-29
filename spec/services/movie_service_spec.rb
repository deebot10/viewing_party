require 'rails_helper'
# require 'figaro'

RSpec.describe MovieService do
  describe 'Movie Service' do
    before(:each) do
      @service = MovieService.new
    end

    describe 'instance methods' do
      describe '#get_movie' do
        it 'returns a movie' do
          expect(@service.get_movie('550')).to have_key(:original_title)
          expect(@service.get_movie('550')).to have_key(:vote_average)
          expect(@service.get_movie('550')).to have_key(:runtime)
        end
      end

      describe '#list_poplar_movies' do
        it 'returns a list of popular movies' do
          expect(@service.list_popular_movies('1').class).to eq(Array)
          expect(@service.list_popular_movies('1').count).to eq(20)

          expect(@service.list_popular_movies('2').class).to eq(Array)
          expect(@service.list_popular_movies('2').count).to eq(20)
        end
      end

      describe '#movie_search' do
        it 'returns a list of movies' do
          expect(@service.movie_search('fight club').class).to eq(Array)
          expect(@service.movie_search('fight club').count).to eq(20)
        end
      end

      describe '#list_cast_members' do
        it 'returns a list of cast members for a movie' do
          expect(@service.list_cast_members('550').class).to eq(Array)
          expect(@service.list_cast_members('550')[0].class).to eq(Hash)
          expect(@service.list_cast_members('550')[0]).to have_key(:name)
          expect(@service.list_cast_members('550')[0]).to have_key(:character)
          expect(@service.list_cast_members('550').count).to eq(10)
        end
      end

      describe '#list_reviews' do
        it 'returns a list of movie reviews' do
          expect(@service.list_reviews('550').class).to eq(Array)
          expect(@service.list_reviews('550')[0].class).to eq(Hash)
          expect(@service.list_reviews('550')[0]).to have_key(:author)
          expect(@service.list_reviews('550')[0]).to have_key(:content)
          expect(@service.list_reviews('550').count).to eq(7)
        end
      end

      describe '#top_40_movies' do
        it 'returns a list of top 40 movies' do
          expect(@service.top_40_movies.count).to eq(40)
        end
      end
    end
  end
end

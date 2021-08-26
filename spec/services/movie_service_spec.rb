require 'rails_helper'
# require 'figaro'

RSpec.describe MovieService do
  describe 'Movie Service' do
    before(:each) do
      @service = MovieService.new  
      # require 'pry'; binding.pry
    end

    describe 'instance methods' do
      describe '#list_poplar_movies' do
        it 'returns a list of popular movies' do
          expect(@service.list_popular_movies('1').class).to eq(Hash)
          expect(@service.list_popular_movies('1').count).to eq(20)
          
          expect(@service.list_popular_movies('2').class).to eq(Hash)
          expect(@service.list_popular_movies('2').count).to eq(20)
        end
      end
    end  
  end
end
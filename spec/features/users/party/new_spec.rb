require 'rails_helper'

RSpec.describe 'Viewing Party form' do
  before(:each) do
    @user = User.create(username: 'test_user', email: 'user', password: 'test')
    @user.authenticate(@user.password)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @user_2 = User.create(username: 'test_user_2', email: 'user2', password: 'test')
    @user_2.authenticate(@user_2.password)
    
    @user_3 = User.create(username: 'test_user_3', email: 'user', password: 'test')
    @user_3.authenticate(@user_3.password)
    
    @user.friends << @user_2
    @user.friends << @user_3

    # allow_any_instance_of(MovieFacade).to receive(:create_movie).and_return(@movie)
    # require 'pry'; binding.pry    
    # @movie = Movie.new(orginal_title: 'Fight Club', overview: 'great', vote_average: 10, genres: ['action'], cast: ['me', 'you', 'i'], reviews: 'Great', runtime: 100, id: 1)
    visit movie_path(550)

    click_on 'Create Viewing Party for Movie'
  end
  
  describe 'Form to create party' do
    it 'has a viewing party attributes' do
      expect(current_path).to eq(new_party_path(@user))
      expect(page).to have_content("Welcome #{@user.username}!")

      expect(page).to have_content('Fight Club')
    end
  end
end
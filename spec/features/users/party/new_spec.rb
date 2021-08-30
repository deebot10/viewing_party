require 'rails_helper'

RSpec.describe 'Viewing Party form' do
  before(:each) do
    @user = User.create(username: 'test_user', email: 'user@test.com', password: 'test_password')
    @user.authenticate(@user.password)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    
    @movie = Movie.new(orginal_title: 'Fight Club', overview: 'great', vote_average: 10, genres: ['action'], cast: ['me', 'you', 'i'], reviews: 'Great', runtime: 100, id: 1)
  end
  
  describe 'Form to create party' do
    it 'has a viewing party attributes' do
      visit new_party_path(@user)
      expect(page).to have_content("Welcome #{@user.username}!")
    end
  end
end
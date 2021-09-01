require 'rails_helper'

RSpec.describe 'Movies index' do
  before(:each) do
    @user = User.create(username: 'test_user', email: 'user@test.com', password: 'test_password')
    @user.authenticate(@user.password)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'top 40 movies' do
    it 'can display the top 40 movies as buttons to the show page' do
      visit discover_path
      click_on 'Discover Top 40 Movies'

      expect(current_path).to eq movies_path
      expect(page).to have_button("Fight Club")

      click_on 'Fight Club'

      expect(current_path).to eq movie_path(550)
    end

    it 'can search for movies' do
      
      visit discover_path

      fill_in :search, with: 'Fight Club'
      click_on 'Search'

      expect(current_path).to eq(movies_path) 
      expect(page).to have_button('Fight Club') 
    end
  end
end

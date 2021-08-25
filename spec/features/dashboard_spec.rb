require 'rails_helper'

RSpec.describe 'User dashboard' do
  describe 'As an authenticated user' do
    before :each do
      @user = User.create!(username: 'test_user', email: 'user@test.com', password: 'test_password')
      @user.authenticate(@user.password)

      # require 'pry'; binding.pry
      visit dashboard_user_path(@user)
    end

    it 'displays a welcome message' do
      expect(page).to have_content("Welcome #{@user.username}!")
    end

    it 'displays a link to discover movies' do
      expect(page).to have_link('Discover Movies')

      click_on 'Discover Movies'
      
      expect(current_path).to eq(user_discover_index_path(@user))
    end
  end
end

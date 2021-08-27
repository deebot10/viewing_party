require 'rails_helper'

RSpec.describe 'User dashboard' do
  describe 'As an authenticated user' do
    before :each do
      @user = User.create(username: 'test_user', email: 'user@test.com', password: 'test_password')
      visit login_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_on "Log In"
    end

    it 'displays a welcome message' do
      expect(page).to have_content("Welcome #{@user.username}!")
    end

    it 'displays a link to discover movies' do
      expect(page).to have_link('Discover Movies')

      click_on 'Discover Movies'

      expect(current_path).to eq('/discover')
    end
  end

  describe 'friends section' do
    it 'displays a message if user has no friends' do
      expect(page).to have_content("You currently have no friends")
    end

    it 'can add a friend' do
      user_2 = User.create!(username: 'test_user_2', email: 'user_2@test.com', password: 'test_password')
      user_3 = User.create!(username: 'test_user_3', email: 'user_3@test.com', password: 'test_password')

      expect(page).not_to have_content(user_2.username)

      fill_in :email, with: user_2.email
      click_on 'Add Friend'

      expect(page).to have_content(user_2.username)
      expect(page).not_to have_content(user_3.username)
    end
  end
end

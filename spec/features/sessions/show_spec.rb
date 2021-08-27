require 'rails_helper'

RSpec.describe 'User dashboard' do
  describe 'As an authenticated user' do
    before :each do
      # @user = User.create(username: 'test_user', email: 'user@test.com', password: 'test_password')
      # # @user.authenticate(@user.password)
      # # # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      # visit login_path
      #
      # fill_in :email, with: @user.email
      # fill_in :password, with: @user.password
      #
      # click_on "Log In"
      @user = User.create(username: 'test_user', email: 'user@test.com', password: 'test_password')
      @user.authenticate(@user.password)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit dashboard_user_path(@user)
    end

    it 'displays a welcome message' do

      expect(page).to have_content("Welcome #{@user.username}!")
    end

    it 'displays a link to discover movies' do
      expect(page).to have_link('Discover Movies')

      click_on 'Discover Movies'

      expect(current_path).to eq(discover_path)
    end
  end

  describe 'friends section' do
    it 'displays a message if user has no friends' do
      expect(page).to have_content("You currently have no friends")
    end

    it 'can add a friend' do
      user_2 = User.create(username: 'test_user_2', email: 'user_2@test.com', password: 'test_password')
      user_3 = User.create(username: 'test_user_3', email: 'user_3@test.com', password: 'test_password')

      expect(page).not_to have_content(user_2.username)

      fill_in :email, with: user_2.email
      click_on 'Add Frien
      d'
      expect(page).to have_content(user_2.username)
      expect(page).to have_content('Friend successfully added!')
      expect(page).not_to have_content(user_3.username)
    end

    it 'displays a list of user friends' do
      user_2 = User.create(username: 'test_user_2', email: 'user_2@test.com', password: 'test_password')
      user_3 = User.create(username: 'test_user_3', email: 'user_3@test.com', password: 'test_password')

      @user.friends.push(user_2)
      @user.friends.push(user_3)

      expect(page).to have_content(user_2.username)
      expect(page).to have_content(user_3.username)
    end

    it 'can not add a friend if their email is not part of the application' do
      user_2 = User.create(username: 'test_user_2', email: 'user_2@test.com', password: 'test_password')
      user_3 = User.create(username: 'test_user_3', email: 'user_3@test.com', password: 'test_password')

      expect(page).not_to have_content(user_4.username)

      fill_in :email, with: user_4.email
      click_on 'Add Friend'
      expect(page).to have_content("I'm sorry your friend cannot be found")
    end

    it 'can not add users own email' do
      fill_in :email, with: @user.email
      click_on 'Add Friend'

      expect(page).to have_content("Unable to add friend")
    end

    it 'can not add existing friends' do
      user_2 = User.create(username: 'test_user_2', email: 'user_2@test.com', password: 'test_password')

      @user.friends.push(user_2)

      fill_in :email, with: user_2.email
      click_on 'Add Friend'

      expect(page).to have_content("Unable to add friend")
    end
  end
end

require 'rails_helper'

RSpec.describe 'User dashboard' do
  describe 'As an authenticated user' do
    it 'displays a welcome message' do
      user = User.create(username: 'test_user', email: 'user@test.com', password: 'test_password')

      visit "/dashboard"

      expect(page).to have_content("Welcome, #{user.username}")
    end
  end
end

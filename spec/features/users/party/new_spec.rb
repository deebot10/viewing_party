require 'rails_helper'

RSpec.describe 'Viewing Party form' do
  before(:each) do
    @user = User.create(username: 'test_user', email: 'user@test.com', password: 'test_password')
    @user.authenticate(@user.password)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit new_party_path(@user)
  end

  describe 'Form to create party' do
    it 'has a viewing party attributes' do
      expect(page).to have_content("Welcome #{@user.username}!")
    end
  end
end
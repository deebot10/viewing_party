require 'rails_helper'

RSpec.describe 'Viewing Party form' do
  before(:each) do
    @user = User.create(username: 'test_user', email: 'user', password: 'test')
    @user.authenticate(@user.password)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @user_2 = User.create(username: 'test_user_2', email: 'user2', password: 'test')
    @user_2.authenticate(@user_2.password)
    
    @user_3 = User.create(username: 'test_user_3', email: 'user3', password: 'test')
    @user_3.authenticate(@user_3.password)
    
    @user.friends << @user_2
    @user.friends << @user_3

    visit movie_path(550)

    click_on 'Create Viewing Party for Movie'
  end
  
  describe 'Form to create party' do
    it 'has a viewing party attributes' do
      expect(current_path).to eq(new_user_party_path(@user))
      expect(page).to have_content("Welcome #{@user.username}!")

      expect(page).to have_content('Fight Club')
      expect(page).to have_content(@user_2.username)
      expect(page).to have_content(@user_3.username)
    end

    it 'can create a party' do

      fill_in :duration, with: 102
      fill_in :day, with: '8/30/21'
      fill_in :start_time, with: '8:00pm'
      click_on 'Create Party'

      expect(current_path).to eq(dashboard_user_path(@user))
    end
  end
end
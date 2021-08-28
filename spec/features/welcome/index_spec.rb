require 'rails_helper'

RSpec.describe 'User registration form' do
  it "creates new user" do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq('/registration')

    username = "test_name"
    email = "user@test.com"
    password = "test_password"

    fill_in :'user[username]', with: username
    fill_in :'user[email]', with: email
    fill_in :'user[password]', with: password
    fill_in :'user[password_confirmation]', with: password

    click_on "Create User"

    expect(page).to have_content("Welcome, #{username}!")
    expect(page).to have_content("Sign-up Successful!")
  end

  it "can not create a new user with missing information" do
    visit root_path

    click_on "Register as a User"

    expect(current_path).to eq('/registration')

    username = "test_name"
    email = "user@test.com"
    password = "test_password"

    fill_in :'user[username]', with: username
    fill_in :'user[password]', with: password
    fill_in :'user[password_confirmation]', with: password

    click_on "Create User"

    expect(page).to have_content('Something went horribly wrong!')
  end
end

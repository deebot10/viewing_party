require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(username: 'test_user', email: "user@test.com", password: "test_password")

    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(dashboard_user_path(user))

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to_not have_link("I already have an account")
    expect(page).to_not have_link("Register as a User")
  end

  it "can not log in with invalid credentials" do
    visit root_path

    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in :email, with: 'invalid@email.com'
    fill_in :password, with: 'invalid_password'

    click_on "Log In"

    expect(page).to have_content("Credentials were bad. Try again.")
  end
end

require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log out " do
    user = User.create(username: 'test_user', email: "user@test.com", password: "test_password")

    visit root_path

    click_on "I already have an account"

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_link("I already have an account")
    expect(page).to have_link("Register as a User")
    expect(page).to_not have_link("Log Out")
  end
end

require 'rails_helper'

RSpec.feature "User creates a user account" do
  scenario "they create and see their account" do
    # As a User
    # When I visit home
    # and click "New Account"
    # and fill in a name
    # and fill in a username
    # and fill in a password
    # and fill in password confirmation
    # and click on "Create User"
    # then I see "Welcome, name!"
    visit '/'
    click_on "Sign Up"
    fill_in "Name", with: "Steve"
    fill_in "Username", with: "Steve"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_on "Create Account"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome, Steve!")
  end
end

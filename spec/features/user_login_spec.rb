require 'rails_helper'

RSpec.feature "User login" do
  context "existing user" do
    scenario "can log in" do
      login_user

      expect(page).to have_content("Welcome, Steve!")
      expect(page).to have_content("Logout")
    end

    scenario "cannot log in with incorrect password" do
      user = create(:user)

      visit login_path

      fill_in "Username", with: user.username
      fill_in "Password", with: "456"

      click_on "Login"

      expect(page).to have_content("Username Password")
    end

    scenario "can log out" do
      login_user
      
      click_on "Logout"

      expect(page).to have_content("Username Password")
    end
  end

  context "non-existant user" do
    scenario "cannot log in" do
      visit login_path

      fill_in "Username", with: "Steve"
      fill_in "Password", with: "123"

      click_on "Login"
      expect(page).to have_content("Username Password")
    end
  end

  def login_user
    user = create(:user)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "123"

    click_on "Login"
  end
end

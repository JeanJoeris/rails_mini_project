require 'rails_helper'

RSpec.feature "Admin creates a location" do
  context "with admin authorization" do
    scenario "with a location name" do
      # As a logged in admin user
      # When I visit the location index
      # and I click new location
      # and I fill in the location name
      # and I click create location
      # I expect to see the location index
      admin = create(:admin_user)
      login_user(admin)

      visit admin_locations_path

      click_on "New Location"

      fill_in "Name", with: "Classroom A"

      click_on "Create Location"

      expect(current_path).to eq(admin_locations_path)
      expect(page).to have_content("Classroom A")
    end

    scenario "without a location name" do
      # As a logged in admin user
      # When I visit the location index
      # and I click new location
      # and I click create location
      # I expect to see the same form with an error
      admin = create(:admin_user)
      login_user(admin)

      visit admin_locations_path

      click_on "New Location"
      click_on "Create Location"

      expect(page).to have_content("Name")
      expect(page).to have_content("Name can't be blank")
    end
  end

  context "without admin authorization" do
    scenario "cannot visit the location index" do
      # As a non-admin user
      # When I visit the location index
      # I expect to see 404
      user = create(:user)
      login_user(user)

      visit admin_locations_path

      expect(page).to have_content("404")
    end

    scenario "cannot visit the new location page" do
      # As a non-admin user
      # When I visit the new location page
      # I expect to see 404
      user = create(:user)
      login_user(user)

      visit new_admin_location_path

      expect(page).to have_content("404")
    end
  end

  def login_user(user)
    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "123"

    click_on "Login"
  end
end

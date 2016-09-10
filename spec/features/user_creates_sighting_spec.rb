require 'rails_helper'

RSpec.feature "User creates a sighting" do
  scenario "they see the page for the sighting" do
    # As a logged in user
    # given an animal and location exists
    # when I visit the sighting index
    # and I click "New Sighting"
    # and I select the animal
    # and I select the location
    # and I select the datetime
    # and I click on "Create Sighting"
    # then I expect to see the sighting animal, location, and time
    animal = create(:animal)
    location = create(:location)
    user = create(:user)
    login_user(user)

    visit sightings_path

    click_on "New Sighting"

    select animal.name, from: "animalSelect"
    select location.name, from: "locationSelect"
    select DateTime.now, from: "datetimeSelect"

    click_on "Create Sighting"

    expect(page).to have_content animal.name
    expect(page).to have_content location.name
  end

  def login_user(user)
    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "123"

    click_on "Login"
  end
end

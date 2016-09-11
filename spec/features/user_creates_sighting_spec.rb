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

    select(animal.name, :from => "sighting_animal_id")
    select(location.name, :from => "sighting_location_id")
    select(2016, :from => "sighting_sighting_time_1i")
    select("August", :from => "sighting_sighting_time_2i")
    select(9, :from => "sighting_sighting_time_3i")
    select(20, :from => "sighting_sighting_time_4i")
    select(59, :from => "sighting_sighting_time_5i")

    click_on "Create Sighting"

    expect(page).to have_content("#{animal.name} was spotted at #{location.name} at 20:59 on August 09")
  end

  scenario "They see a non_sighting" do
    animal = create(:animal)
    location = create(:location)
    user = create(:user)
    login_user(user)

    visit sightings_path

    click_on "New Sighting"

    select(animal.name, :from => "sighting_animal_id")
    select(location.name, :from => "sighting_location_id")
    select(2016, :from => "sighting_sighting_time_1i")
    select("August", :from => "sighting_sighting_time_2i")
    select(9, :from => "sighting_sighting_time_3i")
    select(20, :from => "sighting_sighting_time_4i")
    select(59, :from => "sighting_sighting_time_5i")
    check("sighting_non_sighting")

    click_on "Create Sighting"

    expect(page).to have_content("#{animal.name} was not spotted at #{location.name} at 20:59 on August 09")
  end

  def login_user(user)
    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "123"

    click_on "Login"
  end
end

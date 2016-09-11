require 'rails_helper'

RSpec.feature "User creates animal" do
  context "not logged in" do
    scenario "can't see animal create page" do
      visit new_animal_path

      expect(page).to have_content "You must log in to add an animal"
      expect(page).to_not have_content "Create an Animal"
    end
  end

  context "logged in" do
    scenario "can create an animal" do
      login_user

      visit new_animal_path

      expect(page).to have_content "Create a New Animal!"

      fill_in "Name", with: "Aardvark"
      fill_in "Legs", with: 4

      click_on "Create Animal"

      expect(page).to have_content "Aardvark"
      expect(page).to have_content "Legs: 4"

    end

    scenario "can't create an animal without data" do
      login_user

      visit new_animal_path

      click_on "Create Animal"

      expect(page).to have_content "Name can't be blank, Legs can't be blank"
      expect(page).to have_content "Create a New Animal!"
    end

    scenario "gives a species and sees the taxonomical data" do
      login_user

      visit new_animal_path

      fill_in "Name", with: "Platypus"
      fill_in "Legs", with: 4

      click_on "Create Animal"

      expect(page).to have_content("Animalia")
      expect(page).to have_content("Chordata")
      expect(page).to have_content("Mammalia")
      expect(page).to have_content("Monotremata")
      expect(page).to have_content("Ornithorhynchidae")
      expect(page).to have_content("Ornithorhynchus")
      expect(page).to have_content("Anatinus")
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

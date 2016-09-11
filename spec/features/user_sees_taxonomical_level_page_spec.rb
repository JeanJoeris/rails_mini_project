require 'rails_helper'

RSpec.feature "User sees taxonomical level page" do
  scenario "taxonomical levels already exist" do
    login_user

    visit new_animal_path

    fill_in "Name", with: "Platypus"
    fill_in "Legs", with: 4

    click_on "Create Animal"

    visit new_animal_path

    fill_in "Name", with: "Aardwolf"
    fill_in "Legs", with: 4

    click_on "Create Animal"

    click_on "Chordata"
    save_and_open_page
    expect(page).to have_content("Platypus")
    expect(page).to have_content("Aardwolf")
  end

  def login_user
    user = create(:user)

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "123"

    click_on "Login"
  end
end

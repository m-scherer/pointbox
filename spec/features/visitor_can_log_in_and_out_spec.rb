require 'rails_helper'

describe 'User visits the login page' do
  scenario 'they can log in' do
    user = User.create(name: "Mike", email: "mike@test.com", password: "pass", password_confirmation: "pass")

    visit login_path
    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Log In"
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content(user.name)
    expect(page).to have_content("Logout")
  end

  scenario 'they can log out' do
    user = User.create(name: "Mike", email: "mike@test.com", password: "pass", password_confirmation: "pass")

    visit login_path
    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Log In"
    end
    click_on "Logout"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Successfully logged out!")
  end

end

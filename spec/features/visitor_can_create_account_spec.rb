require 'rails_helper'

describe "User visits a new user page" do
  it "they can create a new user" do

    visit new_user_path
    fill_in "user[name]", with: "Mike"
    fill_in "user[email]", with: "mike@test.com"
    fill_in "user[password]", with: "test"
    fill_in "user[password_confirmation]", with: "test"
    click_on "Create User"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Mike created successfully!")
  end
end

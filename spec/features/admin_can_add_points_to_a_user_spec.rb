require 'rails_helper'

describe 'Admin can add points' do
  let(:admin) { User.create(name: "mike",
                email: "mike@mike.com",
                password: "pass",
                password_confirmation: "pass",
                role: 1
                ) }
  let(:user) { User.create(name: "carl",
                email: "carl@carl.com",
                password: "pass",
                password_confirmation: "pass",
                role: 0
                ) }
  context 'as an admin' do
    it 'they are able to add points to a user' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_user_points_path(user)
      fill_in "user_points[add_points]", with: 100
      click_on "Add Points"

      expect(page).to have_content(100)

      visit new_user_point_path(user)
      fill_in "user_points[add_points]", with: 200
      click_on "Add Points"

      expect(page).to have_content(200)
    end
  end
end

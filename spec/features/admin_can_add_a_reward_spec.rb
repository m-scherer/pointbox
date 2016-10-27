require 'rails_helper'

describe "Admin can create a reward" do

  let(:reward) { Reward.new(name: "Big thing", cost:"100") }

  context "as an admin" do
    it "they can create a reward" do
      admin = User.create(name: "mike",
      email: "mike@mike.com",
      password: "pass",
      password_confirmation: "pass",
      role: 1
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_reward_path
      fill_in "reward[name]", with: reward.name
      fill_in "reward[cost]", with: reward.cost
      click_on "Create Reward"

      expect(page).to have_content(reward.name)
      expect(page).to have_content(reward.cost)
    end
  end

  context "as a default user" do
    it "they can't create a reward" do
      user = User.create(name: "mike",
                      email: "mike@mike.com",
                      password: "pass",
                      password_confirmation: "pass",
                      role: 0
                      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_reward_path(reward)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

end

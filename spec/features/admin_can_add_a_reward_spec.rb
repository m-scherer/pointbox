require 'rails_helper'

describe "Admin can create a reward" do
  scenario "they can create a reward" do
    reward = Reward.new(name: "Big thing", cost:"100")
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

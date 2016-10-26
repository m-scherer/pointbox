require 'rails_helper'

describe "Admin can create a reward" do
  scenario "they can create a reward" do
    reward = Reward.new(name: "Big thing", cost:"100")
    visit new_reward_path
    fill_in "reward[name]", with: reward.name
    fill_in "reward[cost]", with: reward.cost
    click_on "Create Reward"

    expect(page).to have_content(reward.name)
    expect(page).to have_content(reward.cost)
  end
end

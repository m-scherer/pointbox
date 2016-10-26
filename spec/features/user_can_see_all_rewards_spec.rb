require 'rails_helper'

describe "User can see all rewards" do
  scenario "user sees all rewards" do

    reward_one, reward_two = create_list(:reward, 2)

    visit "/rewards"

    expect(page).to have_content(reward_one.name)
    expect(page).to have_content(reward_one.cost)

    expect(page).to have_content(reward_two.name)
    expect(page).to have_content(reward_one.cost)
  end
end

require 'rails_helper'

describe 'Admin can edit a reward' do
  scenario 'they can edit a reward' do
    reward1 = Reward.create(name: "Big thing", cost:"100")
    reward2 = Reward.new(name: "Another thing", cost:"200")

    visit reward_path(reward1)
    click_on "Edit Reward"
    fill_in "reward[name]", with: reward2.name
    fill_in "reward[cost]", with: reward2.cost
    click_on "Update Reward"

    expect(page).to have_content(reward2.name)
    expect(page).to have_content(reward2.cost)
  end
end

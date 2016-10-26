require 'rails_helper'

describe "User can see a single reward" do
  scenario "user see a single reward" do
    rewards = create_list(:reward, 1)
    point_transactions = create_list(:point_transaction, 1)

    visit "/rewards"
    click_on "#{rewards.first.name} ($#{rewards.first.cost})"

    expect(page).to have_content(rewards.first.name)
  end
end

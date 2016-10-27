require 'rails_helper'

describe "User can see a single reward" do
  let!(:rewards) { create_list(:reward, 1) }

  context "as a user" do
    it "user sees a single reward" do
      user = User.create(name: "mike",
                      email: "mike@mike.com",
                      password: "pass",
                      password_confirmation: "pass",
                      role: 0
                      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      point_transactions = create_list(:point_transaction, 1)

      visit rewards_path
      click_on "#{rewards.first.name} ($#{rewards.first.cost})"

      expect(page).to have_content(rewards.first.name)
    end
  end

  context 'as an admin' do
    it "admin sees a single reward" do
      admin = User.create(name: "mike",
                      email: "mike@mike.com",
                      password: "pass",
                      password_confirmation: "pass",
                      role: 1
                      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      point_transactions = create_list(:point_transaction, 1)

      visit admin_rewards_path
      click_on "#{rewards.first.name} ($#{rewards.first.cost})"

      expect(page).to have_content(rewards.first.name)
    end
  end
end

require 'rails_helper'

describe 'Admin can edit a reward' do
  context 'as an admin' do
    it "they can edit a reward" do
      reward1 = Reward.create(name: "Big thing", cost:"100")
      reward2 = Reward.new(name: "Another thing", cost:"200")
      admin = User.create(name: "sal",
                      email: "sal@sal.com",
                      password: "pass",
                      password_confirmation: "pass",
                      role: 1
                      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit reward_path(reward1)
      click_on "Edit Reward"
      fill_in "reward[name]", with: reward2.name
      fill_in "reward[cost]", with: reward2.cost
      click_on "Update Reward"

      expect(page).to have_content(reward2.name)
      expect(page).to have_content(reward2.cost)
    end
  end
end

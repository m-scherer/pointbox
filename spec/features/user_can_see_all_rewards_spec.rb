require 'rails_helper'

describe "User can see all rewards" do
  let!(:rewards) { create_list(:reward, 2) }
  context "as a user" do
    it "user sees all rewards" do
      user = User.create(name: "mike",
                      email: "mike@mike.com",
                      password: "pass",
                      password_confirmation: "pass",
                      role: 0
                      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/rewards"

      expect(page).to have_content(rewards[0].name)
      expect(page).to have_content(rewards[0].cost)

      expect(page).to have_content(rewards[1].name)
      expect(page).to have_content(rewards[1].cost)
    end
  end

  context 'as an admin' do
    it "admin sees all rewards" do
      admin = User.create(name: "mike",
                      email: "mike@mike.com",
                      password: "pass",
                      password_confirmation: "pass",
                      role: 0
                      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit "/rewards"

      expect(page).to have_content(rewards[0].name)
      expect(page).to have_content(rewards[0].cost)

      expect(page).to have_content(rewards[1].name)
      expect(page).to have_content(rewards[1].cost)
    end
  end

end

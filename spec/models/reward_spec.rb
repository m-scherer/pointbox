require 'rails_helper'

RSpec.describe Reward, type: :model do
  context "invalid attributes" do
    it "is invalid without a name" do
      reward = Reward.new(cost: 11)
      expect(reward).to be_invalid
    end
    it "is invalid without a cost" do
      reward = Reward.new(name: "Free shit")
      expect(reward).to be_invalid
    end
    it "is invalid with duplicate names" do
      Reward.create(name: "A thing", cost: 11)
      reward = Reward.new(name: "A thing", cost: 11)
      expect(reward).to be_invalid
    end
  end
  context "valid attributes" do
    it "is valid" do
      reward = Reward.new(name: "A thing", cost: 11)
      expect(reward).to be_valid
    end
  end
  context "relationships" do
    it "has many user rewards" do
      reward = Reward.new(name: "A thing", cost: 11)
      expect(reward).to respond_to(:user_rewards)
      expect(reward).to_not respond_to(:user_reward)
    end
    it "has many users" do
      reward = Reward.new(name: "A thing", cost: 11)
      expect(reward).to respond_to(:users)
      expect(reward).to_not respond_to(:user)
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  context "invalid attributes" do
    it "is invalid without a name" do
      user = User.new(email: "bob@test.com", password: "test")
      expect(user).to be_invalid
    end
    it "is invalid without an email" do
      user = User.new(name: "Bob", password: "test")
      expect(user).to be_invalid
    end
    it "is invalid without a password" do
      user = User.new(name: "Bob", email: "bob@test.com")
      expect(user).to be_invalid
    end
  end
  context "valid attributes" do
    it "is valid" do
      user = User.new(name: "Bob", email: "bob@test.com", password: "test")
      expect(user).to be_valid
    end
  end
  context "relationships" do
    it "has many user rewards" do
      user = User.new(name: "Bob", email: "bob@test.com", password: "test")
      expect(user).to respond_to(:user_rewards)
      expect(user).to_not respond_to(:user_reward)
    end
    it "has many rewards" do
      user = User.new(name: "Bob", email: "bob@test.com", password: "test")
      expect(user).to respond_to(:rewards)
      expect(user).to_not respond_to(:reward)
    end
    it "has many point transactions" do
      user = User.new(name: "Bob", email: "bob@test.com", password: "test")
      expect(user).to respond_to(:point_transactions)
      expect(user).to_not respond_to(:point_transaction)
    end
  end
end

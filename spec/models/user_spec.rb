require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create_list(:user, 1).first }
  let(:transactions) { create_list(:point_transaction, 2) }

  context "invalid attributes" do
    it "is invalid without a name" do
      invalid_user = User.new(email: "bob@test.com", password_digest: "test")
      expect(invalid_user).to be_invalid
    end
    it "is invalid without an email" do
      invalid_user = User.new(name: "Bob", password_digest: "test")
      expect(invalid_user).to be_invalid
    end
    it "is invalid without a pasword" do
      invalid_user = User.new(name: "Bob", email: "bob@test.com")
      expect(invalid_user).to be_invalid
    end
  end

  context "valid attributes" do
    it "is valid" do
      valid_user = User.new(name: "Bob", email: "bob@test.com", password_digest: "test")
      expect(valid_user).to be_valid
    end
  end

  context "relationships" do
    it "has many user rewards" do
      valid_user = User.new(name: "Bob", email: "bob@test.com", password_digest: "test")
      expect(valid_user).to respond_to(:user_rewards)
      expect(valid_user).to_not respond_to(:user_reward)
    end
    it "has many rewards" do
      valid_user = User.new(name: "Bob", email: "bob@test.com", password_digest: "test")
      expect(valid_user).to respond_to(:rewards)
      expect(valid_user).to_not respond_to(:reward)
    end
    it "has many point transactions" do
      valid_user = User.new(name: "Bob", email: "bob@test.com", password_digest: "test")
      expect(valid_user).to respond_to(:point_transactions)
      expect(valid_user).to_not respond_to(:point_transaction)
    end
  end

  context "calculate points" do
    it "can return current point value" do
      transactions.each do |transaction|
        transaction.user = user
        transaction.save
      end

      expected = transactions.reduce(0) do |result, transaction|
        result += transaction.point_change
      end

      expect(user.current_balance).to eq(expected)
      expect(user.current_balance).to_not eq(0)
    end
    it "can returned redeemed points" do
      transactions.each do |transaction|
        transaction.user = user
        transaction.transaction_type.name = "redemption"
        transaction.save
      end
      user.redeemed_points
    end
  end
end

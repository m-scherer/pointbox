require 'rails_helper'

RSpec.describe PointTransaction, type: :model do
  context "invalid attributes" do
    it "is invalid without a point change" do
      point_tran = PointTransaction.new
      expect(point_tran).to be_invalid
    end
  end
  context "valid attributes" do
    it "is valid" do
      point_tran = PointTransaction.new(point_change: 11)
      expect(point_tran).to be_valid
    end
  end
  context "relationships" do
    it "belongs to a user" do
      point_tran = PointTransaction.new(point_change: 11)
      expect(point_tran).to respond_to(:user)
      expect(point_tran).to_not respond_to(:users)
    end
    it "belongs to a transaction type" do
      point_tran = PointTransaction.new(point_change: 11)
      expect(point_tran).to respond_to(:transaction_type)
      expect(point_tran).to_not respond_to(:transaction_types)
    end
  end
end

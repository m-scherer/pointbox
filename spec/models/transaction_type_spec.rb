require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  context "invalid attributes" do
    it "is invalid without a name" do
      tran_type = TransactionType.new
      expect(tran_type).to be_invalid
    end
  end
  context "valid attributes" do
    it "is valid" do
      tran_type = TransactionType.new(name: "Redemption")
      expect(tran_type).to be_valid
    end
  end
  context "relationships" do
    it "belongs to a point transaction" do
      tran_type = TransactionType.new(name: "Redemption")
      expect(tran_type).to respond_to(:point_transaction)
      expect(tran_type).to_not respond_to(:point_transactions)
    end
  end
end

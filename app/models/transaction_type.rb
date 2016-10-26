class TransactionType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :point_transactions
end

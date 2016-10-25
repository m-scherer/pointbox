class TransactionType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :point_transaction
end

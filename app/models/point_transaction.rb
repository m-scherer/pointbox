class PointTransaction < ActiveRecord::Base
  validates :point_change, presence: true

  belongs_to :user
  belongs_to :transaction_type
end

class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password
  has_secure_password

  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  has_many :point_transactions


  def current_balance
    point_transactions.sum(:point_change)
  end

  def redeemed_points
    byebug
    point_transactions.joins(:transaction_type).where(transaction_type_id: 4).sum(:point_change)
  end
end

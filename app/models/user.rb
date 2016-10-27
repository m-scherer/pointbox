class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password
  has_secure_password

  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  has_many :point_transactions

  enum role: [:default, :admin]


  def current_balance
    point_transactions.sum(:point_change)
  end

  def redeemed_points
    point_transactions.joins(:transaction_type).group(:name).sum(:point_change)["redemption"]
  end

end

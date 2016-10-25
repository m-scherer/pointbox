class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  has_many :point_transactions

end

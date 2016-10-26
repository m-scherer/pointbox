FactoryGirl.define do

  factory :point_transaction do
    point_change
    user { FactoryGirl.create(:user) }
    transaction_type { FactoryGirl.create(:transaction_type) }
  end
  sequence :point_change do |n|
    n
  end

end

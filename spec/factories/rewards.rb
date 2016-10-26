FactoryGirl.define do

  factory :reward do
    sequence :name do |n|
      "Reward #{n}"
    end
    cost
  end
  
  sequence :cost do |n|
    n
  end

end

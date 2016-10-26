FactoryGirl.define do

  factory :transaction_type do
    sequence :name do |n|
      "Transaction Type #{n}"
    end
  end

end

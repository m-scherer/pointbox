FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "User #{n}"
    end
    email
    password_digest
  end
  
  sequence :email do |n|
    "email#{n}@test.com"
  end

  sequence :password_digest do |n|
    "password#{n}"
  end
end

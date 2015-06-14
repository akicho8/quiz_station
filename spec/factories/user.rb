FactoryGirl.define do
  factory :user do
    sequence(:email) {|i| "user#{i}@localhost.net" }
    password "(password)"
  end
end

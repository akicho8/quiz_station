FactoryGirl.define do
  factory :book do
    association :user, factory: :user
    sequence(:name) {|i| "(name#{i})" }
  end
end

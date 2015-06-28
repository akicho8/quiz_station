FactoryGirl.define do
  factory :article do
    association :book, factory: :book
    sequence(:question_body) {|i| "(question_body#{i})" }
  end
end

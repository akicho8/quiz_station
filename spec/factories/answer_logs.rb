FactoryGirl.define do
  factory :answer_log do
    association :user, factory: :user
    association :article, factory: :article
  end
end

FactoryGirl.define do
  factory :important_mark do
    association :user, factory: :user
    association :article, factory: :article
  end
end

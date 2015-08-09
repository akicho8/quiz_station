FactoryGirl.define do
  factory :hide_mark do
    association :user, factory: :user
    association :article, factory: :article
  end
end

FactoryGirl.define do
  factory :article do
    sequence(:question_body) {|i| "(question_body#{i})" }
    sequence(:tag_list)      {|i| "(tag#{i})" }
  end
end

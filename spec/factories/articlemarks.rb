FactoryGirl.define do
  factory :articlemark do
    user nil
    article nil
    answered_counter 1
    important_flag false
  end
end

FactoryGirl.define do
  factory :passenger do
    name "Erik Johnson"
    sequence(:email) { |n| "user#{n}@example.com" }
  end
end

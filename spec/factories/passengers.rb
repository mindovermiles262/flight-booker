FactoryGirl.define do
  factory :passenger do
    name "RSpec User"
    sequence(:email) { |n| "user#{n}@example.com" }
  end
end

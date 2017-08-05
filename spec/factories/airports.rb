FactoryGirl.define do
  factory :airport do
    name 'Factory Airport'
    sequence(:code) { ('A'..'Z').to_a.sample(3).join }
  end
end

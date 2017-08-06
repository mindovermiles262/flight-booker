FactoryGirl.define do
  factory :airport do
    name 'Factory Airport'
    sequence :code do |n|
      (0..2).map { (65 + rand(26)).chr }.join
    end
  end
end

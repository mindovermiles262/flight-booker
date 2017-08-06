FactoryGirl.define do
  factory :flight do
    sequence(:number)
    departure FactoryGirl.create(:airport)
    arrival FactoryGirl.create(:airport)
    departure_time "2017-08-04 08:19:57"
  end
end

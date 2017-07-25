Airport.delete_all if Rails.env.development?
airport_codes = %w[ATL LAX ORD DFW JFK DEN SFO CLT LAS PHX]
airport_codes.each do |code|
  Airport.create!(code: code)
end

Flight.delete_all if Rails.env.development?
departure = Airport.find_by(code: "SFO")
arrival   = Airport.find_by(code: "DEN")
Flight.create(departure_airport: departure, arrival_airport: arrival,
              take_off: Time.now, duration: 3.hours.to_i)

Airport.take(4).each do |departure|
  Airport.all.each do |arrival|
    Flight.create(departure_airport: departure, arrival_airport: arrival,
                  take_off: Faker::Time.forward(10), 
                  duration: 3.hours.to_i) if departure != arrival
  end
end
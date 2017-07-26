# Seed Airports (n=10)
Airport.delete_all if Rails.env.development?
airport_codes = %w[ATL LAX ORD DFW JFK DEN SFO CLT LAS PHX]
airport_names = ["Hartsfield–Jackson Atlanta International Airport",
                  "Los Angeles International Airport",
                  "O'Hare International Airport",
                  "Dallas/Fort Worth International Airport",
                  "John F. Kennedy International Airport",
                  "Denver International Airport",
                  "San Francisco International Airport",
                  "Charlotte Douglas International Airport",
                  "McCarran International Airport",
                  "Phoenix Sky Harbor International Airport"]
i = 0
airport_codes.each do |code|
  Airport.create!(code: code, name: airport_names[i] )
  i += 1
end

# Seed Flights (n=37)
Flight.delete_all if Rails.env.development?
departure = Airport.find_by(code: "SFO")
arrival   = Airport.find_by(code: "DEN")
Flight.create(departure_airport_id: departure.id, 
              arrival_airport_id:   arrival.id,
              take_off:             Time.now, 
              duration:             3.hours.to_i)

Airport.take(4).each do |departure|
  Airport.all.each do |arrival|
    unless departure == arrival
    Flight.create(departure_airport_id: departure.id, 
                  arrival_airport_id:   arrival.id,
                  take_off:             Faker::Time.forward(10), 
                  duration:             3.hours.to_i)
    end
  end
end
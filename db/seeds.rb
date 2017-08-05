# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

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

# Seed Flights
Flight.delete_all if Rails.env.development?
fn = 900
dep = Airport.find_by(code: "SFO")
arr   = Airport.find_by(code: "DEN")
Flight.create(departure: dep, 
              arrival: arr,
              departure_time: Time.now,
              number: fn)
fn = 901
Airport.take(4).each do |dep|
  Airport.all.each do |arr|
    unless dep == arr
    Flight.create(departure: dep, 
                  arrival:   arr,
                  departure_time: Faker::Time.forward(10),
                  number: fn)
    fn += 1
    end
  end
end
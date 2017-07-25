Airport.delete_all if Rails.env.development?
airport_codes = %w[ATL LAX ORD DFW JFK DEN SFO CLT LAS PHX]
airport_codes.each do |code|
  Airport.create!(code: code)
end
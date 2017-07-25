require 'test_helper'

class FlightTest < ActiveSupport::TestCase

  def setup
    @airport1 = Airport.first
    @airport2 = Airport.last
    @first_flight = Flight.new(departure_airport: @airport1,
                               arrival_airport:   @airport2,
                               take_off:          Time.now,
                               duration:         10800000) # 3 Hours
  end


  test "the setup" do 
    assert @first_flight.valid?
  end

  test "departure airport presence" do
    @first_flight.departure_airport = nil
    assert_not @first_flight.valid?
  end

  test "arrival airport presence" do 
    @first_flight.arrival_airport = nil
    assert_not @first_flight.valid?
  end

  test "take off presence" do 
    @first_flight.take_off = nil
    assert_not @first_flight.valid?
  end

end

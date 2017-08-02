require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  def setup
    @flight = flights(:one)
    @passenger = passengers(:one)
    @booking = Booking.create(flight: @flight, passenger: @passenger)
  end

  test 'the setup' do 
    assert @booking.valid?
  end

  test 'flight is present' do
    @booking.flight = nil
    assert_not @booking.valid?
  end

  test 'passenger is present' do
    @booking.passenger = nil
    assert_not @booking.valid?
  end
end

module BookingsHelper
  def setup_booking(booking)
    booking.passenger ||= Passenger.new
    booking
  end
end

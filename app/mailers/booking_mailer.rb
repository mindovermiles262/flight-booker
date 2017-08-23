class BookingMailer < ApplicationMailer
  def booking_email(passenger, id)
    @passenger = passenger
    @url = "http://localhost:3000/bookings/#{id}"
    mail(to: @passenger.email, subject: 'Your Flight Booking')
  end
end

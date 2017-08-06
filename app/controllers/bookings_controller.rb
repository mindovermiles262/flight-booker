class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passenger = Passenger.new
    @flight = Flight.find(params[:selected])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      # Success
    else
      flash[:warning] = "Unable to Save Booking"
      render 'bookings/new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:selected, :passenger[:id, :name, :email])
  end
end

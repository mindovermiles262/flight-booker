class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passenger = Passenger.new
    # @flight = Flight.find(params[:selected])
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      @message = "NOT WORKING"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, 
                  {:passenger_attributes => [:id, :name, :email]})
  end

end

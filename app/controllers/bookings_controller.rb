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

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, 
<<<<<<< HEAD
                  {:passengers_attributes => [:id, :name, :email]})
=======
                  {:passenger_attributes => [:id, :name, :email]})
>>>>>>> e0418b2f27d3708bc1ae8a30130847c6adc5705d
  end

end

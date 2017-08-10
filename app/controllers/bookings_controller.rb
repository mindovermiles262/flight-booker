class BookingsController < ApplicationController
  def new
    @manifest = []
    params[:passengers].to_i.times do |p|
      @manifest << Passenger.new
    end
  end

  def create
    booking_passengers = []
    params[:passengers].each do |m|
        booking_passengers << Passenger.create(passenger_params(m))
    end
    # @booking = Booking.new(flight: Flight.find(params[:flight_id]),
    #                    passengers: booking_passengers)
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      raise
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def passenger_params(custom_params)
    custom_params.permit(:name, :email)
  end

  def booking_params
    params.permit(:flight_id, { :passenger_attributes => [:name, :email] } )
  end

end

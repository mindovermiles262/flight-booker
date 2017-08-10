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
    @booking = Booking.new(flight: Flight.find(params[:flight_id]),
                       passengers: booking_passengers)
    if @booking.save
      redirect_to @booking
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def passenger_params(custom_params)
    custom_params.permit(:name, :email)
  end

end

class BookingsController < ApplicationController
  def new
    @manifest = []
    params[:passengers].to_i.times do |p|
      @manifest << Passenger.new
    end
  end

  def create
    params[:passengers].each do |m|
      if m["name"] != "" && m["email"] != ""
        Passenger.create(booking_params(m))
      end
    end
    redirect_to root_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params(custom_params)
    custom_params.permit(:name, :email)
  end

end

class FlightController < ApplicationController

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.create(flight_params)
  end

  def index
    @flights = Flight.all
  end

  def show
  end

private
  
  def flight_params
    params.require(:flights).allow(:departure_airport_id, :arrival_airport_id,
                                  :take_off, :duration)
  end

end

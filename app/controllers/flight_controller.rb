class FlightController < ApplicationController

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.create(flight_params)
  end

  def index
    @departures = Flight.select("DISTINCT departure_airport_id").all.map do |d|
      [d.departure_airport.name, d.departure_airport_id]
    end
    @arrivals = Flight.select("DISTINCT arrival_airport_id").all.map do |a|
      [a.arrival_airport.name, a.arrival_airport_id]
    end
  end

  def show
  end

private
  
  def flight_params
    params.require(:flights).allow(:departure_airport_id, :arrival_airport_id,
                                  :take_off, :duration)
  end

end

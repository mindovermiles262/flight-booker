class FlightsController < ApplicationController
  def show
    @departures = Flight.departure_list.map { |d| [d.departure.name, d.departure_id] }
    @arrivals = Flight.arrival_list.map { |a| [a.arrival.name, a.arrival_id] }
  end
end

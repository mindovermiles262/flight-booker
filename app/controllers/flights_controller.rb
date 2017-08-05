class FlightsController < ApplicationController
  def index
    @departures = Flight.departure_list.map { |d| [d.departure.name, d.departure_id] }
    @arrivals = Flight.arrival_list.map { |a| [a.arrival.name, a.arrival_id] }
    @dates = Flight.date_list

    @flights = Flight.lookup(params[:departing],
                             params[:arriving],
                             params[:date])
  end
end

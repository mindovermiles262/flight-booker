class FlightController < ApplicationController

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.create(flight_params)
  end

  def index
    @departures = Flight.select("DISTINCT departure_airport_id").all.map do |df|
      [df.departure_airport.name, df.departure_airport.id]
    end

    @arrivals = Flight.select("DISTINCT arrival_airport_id").all.map do |af|
      [af.arrival_airport.name, af.arrival_airport.id]
    end
    
    @seats = [1, 2, 3, 4]

    @date = Array.new
    Flight.all.each do |f| 
      take_off_date = f.take_off.strftime("%B %d")
      @date << take_off_date unless @date.include?(take_off_date)
    end
  
    if params[:departure_id]
      @search = Flight.where(departure_airport_id: "#{params[:departure_id]}")
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

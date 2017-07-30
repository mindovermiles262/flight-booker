class AirportsController < ApplicationController
  def new
    @airport = Airport.new
  end

  def create
    @airport = Airport.create(airport_params)
  end

private

  def airport_params
    params.require(:airports).permit(:airport)
  end
end

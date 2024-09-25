class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.where(nil)

    if params[:departure_airport].present? && params[:arrival_airport].present? && params[:date].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport],
                                arrival_airport_id: params[:arrival_airport],
                                start_datetime: Date.parse(params[:date]).all_day)
    end

    if params[:departure_airport].present? && params[:arrival_airport].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport],
                                arrival_airport_id: params[:arrival_airport])
    end
  end
end

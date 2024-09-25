class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  # def new
  #   @flight = Flight.find(params[:flight_id])
  #   @booking = Booking.new(flight: @flight)
  #   @booking.passengers.build
  # end

  def new
    @flight = Flight.find(params[:flight_id])
    @num_passengers = params[:num_passengers].to_i
    @booking = Booking.new(flight: @flight)
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end

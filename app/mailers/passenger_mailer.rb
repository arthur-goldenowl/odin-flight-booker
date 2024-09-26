class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def confirmation_email
    @passenger = params[:passenger]
    @flight = params[:flight]
    mail(to: @passenger.email, subject: "Your Flight Ticket Booking Confirmation")
  end
end

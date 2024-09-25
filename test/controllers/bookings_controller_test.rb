require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_booking_path(flight_id: Flight.first.id, num_passengers: 1)
    assert_response :success
  end

  test "should get show" do
    get booking_path(Booking.first)
    assert_response :success
  end
end

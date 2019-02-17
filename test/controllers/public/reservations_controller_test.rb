require 'test_helper'

class Public::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_reservations_new_url
    assert_response :success
  end

end

require 'test_helper'

class Admin::DealersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_dealers_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_dealers_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_dealers_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_dealers_index_url
    assert_response :success
  end

end

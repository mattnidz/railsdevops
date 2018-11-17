require 'test_helper'

class Nasas::ApodControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get nasas_apod_display_url
    assert_response :success
  end

end

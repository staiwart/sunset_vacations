require 'test_helper'

class TopTensControllerTest < ActionDispatch::IntegrationTest
  test "should get column" do
    get top_tens_column_url
    assert_response :success
  end

  test "should get geochart" do
    get top_tens_geochart_url
    assert_response :success
  end

  test "should get weather" do
    get top_tens_weather_url
    assert_response :success
  end

end

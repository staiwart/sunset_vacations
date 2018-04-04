require 'test_helper'

class WebPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get web_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get web_pages_about_url
    assert_response :success
  end
  
  test "should get cities" do
    get web_pages_cities_url
    assert_response :success
  end
  
  test "should get toptens" do
    get web_pages_toptens_url
    assert_response :success
  end

  test "should get packages" do
    get web_pages_packages_url
    assert_response :success
  end
end

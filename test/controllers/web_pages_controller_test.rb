require 'test_helper'

class WebPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "✈☀⛱" 
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title} >> Home"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "#{@base_title} >> About"
  end
  
  test "should get countries" do
    get countries_path
    assert_response :success
    assert_select "title", "#{@base_title} >> Countries"
  end
  
  test "should get toptens" do
    get toptens_path
    assert_response :success
    assert_select "title", "#{@base_title} >> Top Tens"
  end

  test "should get packages" do
    get packages_path
    assert_response :success
    assert_select "title", "#{@base_title} >> Packages"
  end
end


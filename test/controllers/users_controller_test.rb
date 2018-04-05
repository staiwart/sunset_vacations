require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "✈☀⛱" 
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
    assert_select "title", "#{@base_title} >> Sign Up"
  end

end

require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "", email: "eitt@komma,fo", 
                                country: "Føroyar", password: "password", 
                                password_confirmation: "invalid" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Annar Brúkari", email: "roynd@annar.fo",  
                                country: "Faroe Islands", password: "L0yni0rd", 
                                password_confirmation: "L0yni0rd" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end

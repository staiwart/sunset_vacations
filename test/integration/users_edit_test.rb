require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:roynd)
    @other_user = users(:brukari)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "", email: "eitt@komma,fo",
                                      country: "Føroyar", password:  "password",
                                      password_confirmation: "invalid" } }
    assert_template 'users/edit'
  end
  
  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "Annar Brúkari", email: "roynd@annar.fo",  
                                country: "Faroe Islands", password: "", 
                                password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal "Annar Brúkari",  @user.name
    assert_equal "roynd@annar.fo", @user.email
  end
end

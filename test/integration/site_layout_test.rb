require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "navbars should work" do
    get root_path
    assert_template 'web_pages/home'
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", cities_path
    assert_select "a[href=?]", toptens_path
    assert_select "a[href=?]", packages_path
  end
  
end

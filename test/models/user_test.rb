require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Royndar Brúkari", email: "roynd@hvar.fo", country: "Faroe Islands",
                      password: "L0yniord", password_confirmation: "L0yniord")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end
  
  test "country should be present" do
    @user.country = " "
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = "z" * 101
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "z" * 255
    assert_not @user.valid?
  end

  test "country should not be too long" do
    @user.country = "z" * 46
    assert_not @user.valid?
  end
  
  test "email should accept valid emails" do
    valid_emails = ["roynd@eitt.fo", "peri.od@tvey.it", "under_score@try.com",
                    "pl+us@fyra.org", "dot@dot.fimm.com"]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email.inspect} should be valid"
    end
  end
  
  test "email should reject invalid emails" do
    invalid_emails = ["eitt@komma,fo", "tvey@period.", "try@under_score.com",
                      "fyra@pl+us.org", "fimm_at_wo.at", "seks@dot..dot"]
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} should not be valid"
    end
  end
  
  test "emails should be unique" do
    twin_user = @user.dup
    twin_user.email = @user.email.upcase
    @user.save
    assert_not twin_user.valid?
  end
  
  test "emails should be saved as lower-case" do
    @user.email = "MiX@iTaLL.uP"
    @user.save
    assert_equal "MiX@iTaLL.uP".downcase, @user.reload.email
  end
  
  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "z" * 5
  end
  
  test "authentication should not allow wrong password" do
    @user.save
    assert_not @user.authenticate("WrongPassword")
  end
  
  test "authentication should allow correct password" do
    @user.save
    assert @user.authenticate("L0yniord")
  end
end

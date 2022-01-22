require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Samuel", last_name: "Blankson", email: "blankson@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first_name should be present" do
    @user.first_name = " "
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = " "
    assert_not @user.valid?
  end

  test "email should be present" do 
    @user.email = " "
    assert_not @user.valid?
  end

  test "first_name should not be too long" do
    @user.first_name = "a" * 16
    assert_not @user.valid?
  end

  test "last_name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 251 + "@example.com"
    assert_not @user.valid?
  end

end

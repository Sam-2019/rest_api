require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Samuel", last_name: "Blankson", email: "blankson@gmail.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

end

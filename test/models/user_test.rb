require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "test@example.com", password: "password")
  end

  test "is valid" do
    assert @user.valid?
  end

  test "email is present" do
    @user.email = ""
    assert_not @user.valid?
  end
end

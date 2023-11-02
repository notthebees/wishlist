require "test_helper"

class WishTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(email: "test@example.com", password: "password")
    @wish = @user.wishes.build(title: "Test Wish", body: "This is a test wish.")
  end

  test "is valid" do
    assert @wish.valid?
  end

  test "title is present" do
    @wish.title = ""
    assert_not @wish.valid?
  end
end

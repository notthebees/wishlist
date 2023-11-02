require "test_helper"

class WishesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: "test@example.com", password: "password")
    @wish = @user.wishes.build(title: "Test Wish", body: "This is a test wish.")
  end

  test "redirects to login page if unauthenticated" do
    get wishes_url
    assert_redirected_to login_url
    get wishes_url(@wish)
    assert_redirected_to login_url
  end

  test "gets wishes if authenticated" do
    post login_url, params: { session: { email: @user.email, password: 'password' } }
    get wishes_url
    assert_response :success
  end

  test "shows wish if authenticated" do
    post login_url, params: { session: { email: @user.email, password: 'password' } }
    get wishes_url(@wish)
    assert_response :success
  end
end

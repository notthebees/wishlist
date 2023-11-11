require "test_helper"

class WishesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: "test@example.com", password: "password")
    @wish = @user.wishes.create!(title: "Test Wish", body: "This is a test wish.")
  end

  test "redirects to login page if unauthenticated" do
    get user_wishes_url(@user)
    assert_redirected_to login_url
    get user_wish_url(@user, @wish)
    assert_redirected_to login_url
  end

  test "gets user's wishes if authenticated" do
    post login_url, params: { session: { email: @user.email, password: 'password' } }
    get user_wishes_url(@user)
    assert_response :success
  end

  test "shows wish if authenticated" do
    post login_url, params: { session: { email: @user.email, password: 'password' } }
    get user_wish_url(@user, @wish)
    assert_response :success
  end

  test "gets new wish form if authenticated" do
    post login_url, params: { session: { email: @user.email, password: 'password' } }
    get new_user_wish_url(@user)
    assert_response :success
  end
end

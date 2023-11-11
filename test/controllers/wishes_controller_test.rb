require "test_helper"

class WishesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: "user1@example.com", password: "password")
    @wish = @user.wishes.create!(title: "user1 wish")
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
    assert_includes @response.body, @wish.title
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

  test "gets a different user's wishes" do
    user2 = User.create!(email: "user2@example.com", password: "password")
    user2_wish = user2.wishes.create!(title: "user2 wish")
    post login_url, params: { session: { email: @user.email, password: 'password' } }
    get user_wishes_url(user2)
    assert_response :success
    assert_includes @response.body, user2_wish.title
  end
end

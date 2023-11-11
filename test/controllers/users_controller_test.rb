require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user1 = User.create!(email: "user1@example.com", password: "password")
    @user2 = User.create!(email: "user2@example.com", password: "password")
  end

  test "adds a friend" do
    post login_url, params: { session: { email: @user1.email, password: 'password' } }

    post add_friend_user_url(@user1), params: { friend_id: @user2.id }

    assert_response :redirect
    assert_redirected_to user_path(@user1)
    assert_equal "Friend added successfully.", flash[:notice]
    assert @user1.friends.include?(@user2)
    assert @user2.friends.include?(@user1)
  end

  test "does not add a friend if unauthenticated" do
    post add_friend_user_url(@user1), params: { friend_id: @user2.id }

    assert_response :redirect
    assert_redirected_to login_url
    refute @user1.friends.include?(@user2)
    refute @user2.friends.include?(@user1)
  end

  test "does not add a friend for a user that is not the logged in user" do
    post login_url, params: { session: { email: @user1.email, password: 'password' } }

    post add_friend_user_url(@user2), params: { friend_id: @user1.id }

    assert_response :unauthorized
  end
end

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "adds a friend" do
    user1 = User.create!(email: "user1@example.com", password: "password")
    user2 = User.create!(email: "user2@example.com", password: "password")

    post add_friend_user_url(user1), params: { friend_id: user2.id }

    assert_response :redirect
    assert_redirected_to user_path(user1)
    assert_equal "Friend added successfully.", flash[:notice]
    assert user1.friends.include?(user2)
    assert user2.friends.include?(user1)
  end
end

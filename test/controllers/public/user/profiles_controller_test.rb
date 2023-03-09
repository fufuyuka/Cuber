require "test_helper"

class Public::User::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_user_profiles_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_user_profiles_edit_url
    assert_response :success
  end
end

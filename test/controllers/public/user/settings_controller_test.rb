require "test_helper"

class Public::User::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_user_settings_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_user_settings_edit_url
    assert_response :success
  end
end

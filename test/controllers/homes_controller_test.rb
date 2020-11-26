require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top_before_login" do
    get homes_top_before_login_url
    assert_response :success
  end

  test "should get top_after_login" do
    get homes_top_after_login_url
    assert_response :success
  end

  test "should get about" do
    get homes_about_url
    assert_response :success
  end

end

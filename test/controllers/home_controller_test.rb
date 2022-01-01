require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get after_login_to_custom" do
    get home_after_login_to_custom_url
    assert_response :success
  end

end

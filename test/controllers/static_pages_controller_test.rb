require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy-policy" do
    get static_pages_privacy-policy_url
    assert_response :success
  end

end

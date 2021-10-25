require 'test_helper'

class CustomsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customs_new_url
    assert_response :success
  end

  test "should get edit" do
    get customs_edit_url
    assert_response :success
  end

end

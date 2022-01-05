require 'test_helper'

class Admins::CustomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_customs_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_customs_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_customs_destroy_url
    assert_response :success
  end

end

require "test_helper"

class Api::V1::FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_foods_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_foods_create_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_foods_show_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_foods_destroy_url
    assert_response :success
  end
end

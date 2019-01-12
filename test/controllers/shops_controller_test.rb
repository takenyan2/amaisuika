require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get shops_main_url
    assert_response :success
  end

  test "should get index" do
    get shops_index_url
    assert_response :success
  end

  test "should get new" do
    get shops_new_url
    assert_response :success
  end

  test "should get show" do
    get shops_show_url
    assert_response :success
  end

  test "should get edit" do
    get shops_edit_url
    assert_response :success
  end

  test "should get follow" do
    get shops_follow_url
    assert_response :success
  end

  test "should get seach" do
    get shops_seach_url
    assert_response :success
  end

  test "should get prefectures" do
    get shops_prefectures_url
    assert_response :success
  end

  test "should get update" do
    get shops_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shops_destroy_url
    assert_response :success
  end

end

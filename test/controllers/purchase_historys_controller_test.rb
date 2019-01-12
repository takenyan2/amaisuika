require 'test_helper'

class PurchaseHistorysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get purchase_historys_new_url
    assert_response :success
  end

  test "should get create" do
    get purchase_historys_create_url
    assert_response :success
  end

end

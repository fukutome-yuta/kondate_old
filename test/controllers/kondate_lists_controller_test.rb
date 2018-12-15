require 'test_helper'

class KondateListsControllerTest < ActionDispatch::IntegrationTest
  test "should get createKondate" do
    get kondate_lists_createKondate_url
    assert_response :success
  end

  test "should get updateKondate" do
    get kondate_lists_updateKondate_url
    assert_response :success
  end

  test "should get deleteKondate" do
    get kondate_lists_deleteKondate_url
    assert_response :success
  end

end

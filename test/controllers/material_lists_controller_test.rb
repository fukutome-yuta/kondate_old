require 'test_helper'

class MaterialListsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get material_lists_create_url
    assert_response :success
  end

  test "should get update" do
    get material_lists_update_url
    assert_response :success
  end

  test "should get delete" do
    get material_lists_delete_url
    assert_response :success
  end

end

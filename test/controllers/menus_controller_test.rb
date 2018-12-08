require 'test_helper'

class MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get menus_search_url
    assert_response :success
  end

  test "should get edit" do
    get menus_edit_url
    assert_response :success
  end

end

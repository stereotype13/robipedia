require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get wiki_table_data" do
    get :wiki_table_data
    assert_response :success
  end

end

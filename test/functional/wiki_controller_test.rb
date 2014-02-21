require 'test_helper'

class WikiControllerTest < ActionController::TestCase
  test "should get preview" do
    get :preview
    assert_response :success
  end

end

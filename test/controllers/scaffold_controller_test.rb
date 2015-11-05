require 'test_helper'

class ScaffoldControllerTest < ActionController::TestCase
  test "should get opening" do
    get :opening
    assert_response :success
  end

end

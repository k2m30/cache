require 'test_helper'

class OutgraderControllerTest < ActionController::TestCase
  test "should get links" do
    get :links
    assert_response :success
  end

  test "should get redirect" do
    get :redirect
    assert_response :success
  end

end

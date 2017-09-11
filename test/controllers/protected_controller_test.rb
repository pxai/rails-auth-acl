require 'test_helper'

class ProtectedControllerTest < ActionController::TestCase
  test "should not get index" do
    get :index
    assert_response 302
  end

end

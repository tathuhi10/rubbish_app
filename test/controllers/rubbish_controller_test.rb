require 'test_helper'

class RubbishControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should post search" do
    post search_path
    assert_response :success
  end

end

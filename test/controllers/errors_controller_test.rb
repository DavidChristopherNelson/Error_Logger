require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get errors_new_url
    assert_response :success
  end
end

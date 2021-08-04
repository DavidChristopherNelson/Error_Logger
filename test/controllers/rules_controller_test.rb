require "test_helper"

class RulesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rules_new_url
    assert_response :success
  end
end

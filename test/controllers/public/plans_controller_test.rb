require "test_helper"

class Public::PlansControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_plans_create_url
    assert_response :success
  end
end

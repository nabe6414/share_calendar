require "test_helper"

class Public::InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_invitations_new_url
    assert_response :success
  end

  test "should get show" do
    get public_invitations_show_url
    assert_response :success
  end
end

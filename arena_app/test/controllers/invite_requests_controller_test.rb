require 'test_helper'

class InviteRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invite_request = invite_requests(:one)
    log_in_as(gamers(:michael))
    get upgrade_url
    get upgrade_path
    get upgrade_path
  end

  test "should get index" do
    get invite_requests_url
    assert_redirected_to root_url
  end

  test "should get new" do
    get new_invite_request_url
    assert_redirected_to root_url
  end

  test "should show invite_request" do
    get invite_request_url(@invite_request)
    assert_redirected_to root_url
  end

  test "should get edit" do
    get edit_invite_request_url(@invite_request)
    assert_redirected_to root_url
  end

  test "should update invite_request" do
    patch invite_request_url(@invite_request), params: { invite_request: {  } }
    assert_redirected_to root_url
  end

end

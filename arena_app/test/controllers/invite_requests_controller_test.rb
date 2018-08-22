require 'test_helper'

class InviteRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invite_request = invite_requests(:one)
  end

  test "should get index" do
    get invite_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_invite_request_url
    assert_response :success
  end

  test "should create invite_request" do
    assert_difference('InviteRequest.count') do
      post invite_requests_url, params: { invite_request: {  } }
    end

    assert_redirected_to invite_request_url(InviteRequest.last)
  end

  test "should show invite_request" do
    get invite_request_url(@invite_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_invite_request_url(@invite_request)
    assert_response :success
  end

  test "should update invite_request" do
    patch invite_request_url(@invite_request), params: { invite_request: {  } }
    assert_redirected_to invite_request_url(@invite_request)
  end

  test "should destroy invite_request" do
    assert_difference('InviteRequest.count', -1) do
      delete invite_request_url(@invite_request)
    end

    assert_redirected_to invite_requests_url
  end
end

require 'test_helper'

class InviteRequestsControllerTest < ActionDispatch::IntegrationTest
  #fixtures :all
  setup do
    @invite_request = invite_requests(:one)
    log_in_as(gamers(:michael))
    get upgrade_url
    get upgrade_url
    get upgrade_url
  end

  test "should get index" do
    get team_invite_requests_path(teams(:one))
    assert_redirected_to root_path
  end

  # test "should get new" do
  #   get new_team_invite_request_path(teams(:one))
  #   assert_redirected_to root_path
  # end

  test "should show invite_request" do
    get team_invite_request_path((teams(:one)),@invite_request)
    assert_redirected_to root_path
  end

  # test "should get edit" do
  #   get edit_team_invite_request_path((teams(:one)),@invite_request)
  #   assert_redirected_to root_path
  # end

  test "should destroy invite_request" do
    assert_difference('InviteRequest.count', -1) do
      delete team_invite_request_path((teams(:one)),@invite_request)
    end
    assert_redirected_to team_invite_requests_url((teams(:one)))

  end

end

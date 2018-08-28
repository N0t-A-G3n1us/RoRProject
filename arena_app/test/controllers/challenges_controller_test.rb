require 'test_helper'

class ChallengesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @challenge = challenges(:one)
    log_in_as(gamers(:michael))
    get upgrade_url
    get upgrade_path
    get upgrade_path
  end

  test "should get index" do
    get challenges_url
    assert_redirected_to root_url
  end

  test "should get new" do
    get new_challenge_url
    assert_redirected_to root_url
  end


  test "should show challenge" do
    get challenge_url(@challenge)
    assert_redirected_to root_url
  end

  test "should get edit" do
    get edit_challenge_url(@challenge)
    assert_redirected_to root_url
  end

  test "should update challenge" do
    patch challenge_url(@challenge), params: { challenge: {  } }
    assert_redirected_to root_url
  end


end

require 'test_helper'

class MatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @match = matches(:one)
    log_in_as(gamers(:michael))
    get upgrade_url
    get upgrade_path
    get upgrade_path
  end

  test "should get index" do
    get matches_url
   assert_redirected_to root_url
  end

  test "should get new" do
    get new_match_url
    assert_redirected_to root_url
  end


  test "should show match" do
    get match_url(@match)
    assert_redirected_to root_url
  end

  test "should get edit" do
    get edit_match_url(@match)
    assert_redirected_to root_url
  end

  test "should update match" do
    patch match_url(@match), params: { match: {  } }
    assert_redirected_to root_url
  end

end

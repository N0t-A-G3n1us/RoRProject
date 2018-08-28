require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:two)
    log_in_as(gamers(:michael))
    get upgrade_url
    get upgrade_path
    get upgrade_path
  end



  test "should get new" do
    get new_group_url
    assert_response :success
  end



  test "should get edit" do
    get edit_group_url(@group)
    assert_response :success
  end

  test "should update group" do
    patch group_url(@group), params: { group: { console: @group.console, game_id: @group.game_id, name: @group.name, region: @group.region } }
    assert_response :success
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end

    assert_redirected_to groups_url
  end
end

require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chatroom = chatrooms(:one)
    @group=groups(:one)
    complete_log_in
  end

  test "should get index" do
    get group_chatrooms_path(@group)#, params: {group_id:@group.id}
    assert_response :success
  end

  test "should get new" do
    get new_group_chatroom_url(@group)
    assert_response :success
  end

  test "should create chatroom" do
    assert_difference('Chatroom.count') do
      post group_chatrooms_url, params: { group:{name: @group.name},chatroom: { name: @chatroom.name } }
    end

    assert_redirected_to chatroom_url(Chatroom.last)
  end

  test "should show chatroom" do
    get  group_chatroom_url(@group,@chatroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_chatroom_url(@group,@chatroom)
    assert_response :success
  end

  test "should update chatroom" do
    patch group_chatroom_url(@chatroom), params: {group:{name:@group.name}, chatroom: { name: @chatroom.name } }
    assert_redirected_to chatroom_url(@chatroom)
  end

  test "should destroy chatroom" do
    assert_difference('Chatroom.count', -1) do
      delete group_chatroom_url(@group,@chatroom)
    end

    assert_redirected_to chatrooms_url
  end
end

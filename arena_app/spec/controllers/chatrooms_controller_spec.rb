require("rails_helper")

RSpec.describe ChatroomsController, type: :controller do
  fixtures :all
  before do
    @chatroom = chatrooms(:one)
    @group = groups(:one)
    allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil } 
  end
  it("should get index") do
    get :index,params:{ id: @group.to_param }
    assert_response(:success)
  end
  it("should get new") do
    get :new, params:{id: @group.to_param}
    assert_response(:success)
  end
  it("should create chatroom") do
    expect do
      post :create,params:{group_id:@group.id }
    end.to(change { Chatroom.count })
    assert_redirected_to(chatroom_url(Chatroom.last))
  end
  it("should show chatroom") do
    get(group_chatroom_url(@group, @chatroom))
    assert_response(:success)
  end
  it("should get edit") do
    get(edit_group_chatroom_url(@group, @chatroom))
    assert_response(:success)
  end
  it("should update chatroom") do
    patch(group_chatroom_url(@chatroom), :params => ({ :group => ({ :name => @group.name }), :chatroom => ({ :name => @chatroom.name }) }))
    assert_redirected_to(chatroom_url(@chatroom))
  end
  it("should destroy chatroom") do
    expect { delete(group_chatroom_url(@group, @chatroom)) }.to(change { Chatroom.count }.by(-1))
    assert_redirected_to(chatrooms_url)
  end
end

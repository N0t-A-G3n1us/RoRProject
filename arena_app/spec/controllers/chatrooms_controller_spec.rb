require("rails_helper")

RSpec.describe ChatroomsController, type: :controller do
  fixtures :all
  before do
    @chatroom = chatrooms(:one)
    @group = groups(:one)
    
    #NEXT LINE DISABLE CANCANCAN 
    allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil } 
  end

  let(:valid_attributes){ { name:"myBuildedChat", group_id: @group.id} }
  let(:new_valid_attributes){{name:"myUpdatedChat"}}

  it("should get index") do
    get :index,params:{ id: @group.to_param }
    assert_response(:success)
  end
  it("should get new") do
    get :new, params:{group_id: @group.to_param}
    assert_response(:success)
  end
  it("should create chatroom") do
    expect do
      post :create,params:{group_id:@group.to_param,chatroom: valid_attributes }
    end.to(change { Chatroom.count })
    expect(Chatroom.last.name).to eq(valid_attributes[:name]) 
    assert_redirected_to(group_chatroom_url(@group,Chatroom.last) )
  end
  it("should show chatroom") do
    get :show, params:{group_id: @group.to_param,id: Chatroom.last.id}
    assert_response(:success)
  end
  it("should get edit") do
    get :edit, params: {group_id: @group.to_param,id: Chatroom.last.id}
    assert_response(:success)
  end
  it("should update chatroom") do
    chatroom= Chatroom.create! valid_attributes
    patch :update, params:{group_id: @group.to_param,id: chatroom.id,chatroom: new_valid_attributes }
    expect(Chatroom.last.name).to(eq(new_valid_attributes[:name]))
    assert_redirected_to(group_chatroom_url(@group,Chatroom.last))
  end
  it("should destroy chatroom") do
    chatroom= Chatroom.create! valid_attributes
    expect { delete :destroy ,params:{group_id: @group.to_param,id: chatroom.id } }.to(change { Chatroom.count }.by(-1))
    assert_redirected_to(group_chatrooms_url)
  end
end

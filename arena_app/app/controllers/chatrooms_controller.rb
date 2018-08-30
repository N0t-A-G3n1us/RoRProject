class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]
  #before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /chatrooms
  # GET /chatrooms.json
  def index
    @chatrooms = Chatroom.all
  end

  # GET /chatrooms/1
  # GET /chatrooms/1.json
  def show

  end

  # GET /chatrooms/new
  def new
    @group = Group.find(params[:group_id])
    @chatroom = @group.chatrooms.build
  end

  # GET /chatrooms/1/edit
  def edit
    @group = Group.find(params[:group_id])
  end

  # POST /chatrooms
  # POST /chatrooms.json
  def create
    @group = Group.find(params[:group_id])
    @chatroom = @group.chatrooms.build(chatroom_params)

    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to group_chatroom_url(@group, @chatroom), notice: 'Chatroom was successfully created.' }
        format.json { render :show, status: :created, location: @chatroom }
      else
        format.html { render :new }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatrooms/1
  # PATCH/PUT /chatrooms/1.json
  def update
    @group= Group.find(params[:group_id])
    @chatroom.update(chatroom_params)
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        format.html { redirect_to group_chatroom_url(@group, @chatroom), notice: 'Chatroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatroom }
      else
        format.html { render :edit }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatrooms/1
  # DELETE /chatrooms/1.json
  def destroy
    @chatroom.destroy
    respond_to do |format|
      format.html { redirect_to group_chatrooms_url, notice: 'Chatroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chatroom_params
      params.require(:chatroom).permit(:name,:group_id)
    end
end

class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]
  include ChatroomsHelper

  # GET /chatrooms
  # GET /chatrooms.json
  def index
    @chatrooms = Chatroom.all
      if (params[:group_id].present?)
      @parent = Group.find(params[:group_id])
    else 
      @parent = Team.find(params[:team_id])
    end
  end

  # GET /chatrooms/1
  # GET /chatrooms/1.json
  def show
    @chatroom = Chatroom.find(params[:id])
    parent_check

  end

  # GET /chatrooms/new
  def new
    if (params[:group_id].present?)
      @parent = Group.find(params[:group_id])
    else 
      @parent = Team.find(params[:team_id])
    end
    #@parent = Group.find(params[:group_id])
    @chatroom = @parent.chatrooms.build
  end

  # GET /chatrooms/1/edit
  def edit
    @chatroom = Chatroom.find(params[:id])
    parent_check
  end

  # POST /chatrooms
  # POST /chatrooms.json
  def create
    
    if (params[:group_id].present?)
      @parent = Group.find(params[:group_id])

    else 
      @parent = Team.find(params[:team_id])
    end


    @chatroom = @parent.chatrooms.build(chatroom_params)

    respond_to do |format|
      if @chatroom.save
        if (params[:group_id].present?)
          format.html { redirect_to group_url(@parent), notice: 'Chatroom was successfully created.' }
          format.json { render :show, status: :created, location: @chatroom }
        else
          format.html { redirect_to team_url(@parent), notice: 'Chatroom was successfully created.' }
          format.json { render :show, status: :created, location: @chatroom }
        end
      else
        format.html { render :new }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatrooms/1
  # PATCH/PUT /chatrooms/1.json
  def update
    if (params[:group_id].present?)
      @parent = Group.find(params[:group_id])
    else 
      @parent = Team.find(params[:team_id])
    end
    #@parent= Group.find(params[:group_id])
    @chatroom.update(chatroom_params)
    respond_to do |format|
      if @chatroom.update(chatroom_params)
        if (params[:group_id].present?)
          format.html { redirect_to group_url(@parent), notice: 'Chatroom was successfully updated.' }
          format.json { render :show, status: :created, location: @chatroom }
        else
          format.html { redirect_to team_url(@parent), notice: 'Chatroom was successfully updated.' }
          format.json { render :show, status: :created, location: @chatroom }
        end
        
      else
        format.html { render :edit }
        format.json { render json: @chatroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatrooms/1
  # DELETE /chatrooms/1.json
  def destroy
    parent_check
    @chatroom.destroy
    respond_to do |format|
        if (params[:group_id].present?)
          format.html { redirect_to group_url(@parent), notice: 'Chatroom was successfully destroyed.' }
          format.json { render :show, status: :created, location: @chatroom }
        else
          format.html { redirect_to team_url(@parent), notice: 'Chatroom was successfully destroyed.' }
          format.json { render :show, status: :created, location: @chatroom }
        end
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
      params.require(:chatroom).permit(:name, :team_id, :group_id)
    end
end

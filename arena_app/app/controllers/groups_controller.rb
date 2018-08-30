class GroupsController < ApplicationController
  load_and_authorize_resource
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
   @group = Group.find(params[:id])
 end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    #salvo il gruppo nel gamer
    @group.creator=current_gamer
    
    @group.members << current_gamer 

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    #puts "---------->"+current_member.id.to_s
    @group =Group.find(params[:group_id])
    #puts "---------->"+ @group.id.to_s
    @group.members << Gamer.find_by_id(current_gamer.id) unless current_gamer.groups.include?(@group) || @group.members.include?(current_gamer)
    # @member = current_gamer.groups.build(params[:id])
    # @group = @member.build_group(params[:group])
    redirect_to @group
  end

  def leave

    @group =Group.find(params[:group_id])
    @member = @group.members.find_by_id(current_gamer.id)
    if(@group.creator==@member)
      destroy
    else
      @group.members.delete(@member) unless @member.nil?
      redirect_to @group
    end
  end

  def my_groups
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:member,:name, :region, :console_id,{:game_ids => []}, :description)
    end
  end

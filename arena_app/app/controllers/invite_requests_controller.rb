class InviteRequestsController < ApplicationController
  load_and_authorize_resource :team
  load_and_authorize_resource :invite_request, through: :team

  before_action :set_invite_request, only: [:show, :edit, :update, :destroy]

  # GET /invite_requests
  # GET /invite_requests.json
  def index
    @team = Team.find_by_id(params[:team_id])
    @invite_requests = @team.invite_requests
  end
  # GET /invite_requests/1
  # GET /invite_requests/1.json
  def show
  end

  # GET /invite_requests/new
  def new
    @invite_request = InviteRequest.new
  end

  # GET /invite_requests/1/edit
  def edit
  end

  # POST /invite_requests
  # POST /invite_requests.json
  def create
    @invite_request = InviteRequest.new(invite_request_params)

    respond_to do |format|
      if @invite_request.save
        format.html { redirect_to @invite_request, notice: 'Invite request was successfully created.' }
        format.json { render :show, status: :created, location: @invite_request }
      else
        format.html { render :new }
        format.json { render json: @invite_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invite_requests/1
  # PATCH/PUT /invite_requests/1.json
  def update
    respond_to do |format|
      if @invite_request.update(invite_request_params)
        format.html { redirect_to @invite_request, notice: 'Invite request was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite_request }
      else
        format.html { render :edit }
        format.json { render json: @invite_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invite_requests/1
  # DELETE /invite_requests/1.json
  def destroy
    @invite_request.destroy
    render :index

  end

  def accept
    @team = Team.find_by_id(params[:team_id])
    @inv=InviteRequest.find_by_id(params[:invite_request_id])
    if @team.nil?
      flash[:danger]="Not found this team"
    elsif @inv.nil?
      flash[:danger]="Not found this invite request"
    elsif @inv.gamer.team.nil?
      @team.gamers << @inv.gamer
      flash[:success]="Added gamer"
      @team.invites.delete(@inv.gamer)
      @inv.destroy
    else 
      flash[:danger]="Impossible: the gamer is altready member of a team"
    end
    render :index
  end

  def refuse
    @team = Team.find_by_id(params[:team_id])
    @inv=InviteRequest.find_by_id(params[:invite_request_id])
    if @team.nil?
      flash[:danger]="Not found this team"
    elsif @team.gamers.include?(@inv.gamer)
      flash[:warning]="Gamer already in team"
    elsif @inv.nil?
      flash[:danger]="Not found this invite request"
    else
      @team.invites.delete(@inv.gamer)
      flash[:success]="Removed invite"
      @inv.destroy
    end
    render 'index'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite_request
      @invite_request = InviteRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def invite_request_params
    #   params.fetch(:invite_request, :team_id,{})
    # end

  def invite_request_params
    params.require(:invite_request).permit(:invite_request, :team_id)
  end
end

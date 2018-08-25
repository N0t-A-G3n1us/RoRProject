class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    @team =Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.boss=current_gamer
    @team.gamers << current_gamer
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # #  # # # # # NOT CRUD


  def join
    #puts "---------->"+current_gamer.id.to_s
    @team =Team.find(params[:team_id])
    #puts "---------->"+ @team.id.to_s
    
    @team.gamers << Gamer.find_by_id(current_gamer.id) unless current_gamer.team==@team
    
    redirect_to @team
  end

  def leave

    @team =Team.find(params[:team_id])
    @gamer = current_gamer
    @team.gamers.delete(@gamer) unless @gamer.nil?
    redirect_to @team
  end


  def show_invites
    @team = Team.find(params[:team_id])
    redirect_to team_invite_requests_path(@team)
  end

  def add_challenge
    @team = Team.find(params[:team_id])
    @team.challenges.create(team_id: @team.id, challenging_team_id: current_gamer.team.id)
    render :show
  end 




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :boss_id, {:invite_ids => []},
          {:match_ids => []} ,{ :challenge_ids => [] },
           {:gamer_ids => []},:game_id , :console, :avatar )
    end

  
end

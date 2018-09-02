class TeamsController < ApplicationController
  load_and_authorize_resource
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :check_attributes
  prepend_before_action :can_be_challenged,only: [:add_challenge] 
    

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

    # if ! current_gamer.team.nil?
    #   flash[:danger]="You already have a team"
    #   redirect_to teams_path
    # else 

    respond_to do |format|
      if @team.save
        
        @team.boss=current_gamer
        @team.gamers << current_gamer

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


  def send_invite
    @team = Team.find(params[:team_id])
    if (!@team.invites.include? current_gamer)
      InviteRequest.create(gamer_id: current_gamer.id,team_id: @team.id) 
    else
      flash[:danger]="You already have sent this invite"
    end
    redirect_to @team
  end



  # def join
  #   #puts "---------->"+current_gamer.id.to_s
  #   @team =Team.find(params[:team_id])
  #   #puts "---------->"+ @team.id.to_s
    
  #   @team.gamers << Gamer.find_by_id(current_gamer.id) unless current_gamer.team.nil? || current_gamer.team==@team
    
  #   redirect_to @team
  # end

  def leave

    @team =Team.find(params[:team_id])
    @gamer = current_gamer
    if(@team.boss==@gamer)
      destroy
    else
      @team.gamers.delete(@gamer) unless @gamer.nil?
      redirect_to @team
    end
      
    
  end


  def show_invites
    @team = Team.find(params[:team_id])
    redirect_to team_invite_requests_path(@team)
  end

  def add_challenge
    @team = Team.find(params[:team_id])
    if @team==current_gamer.team
      flash[:danger]="This is your team, you cannot challenge"
    #elsif (!@team.challenges.include? Challenge.find_by(challenging_team: current_gamer.team) )
    
      # @team.challenges.each do |t|
      #   #flash[:danger]= "---->"  + t.team.inspect + t.challenging_team.inspect + @team.challenges.class.inspect
      # end
    else
      @team.challenges << Challenge.create(team:@team,challenging_team: current_gamer.team )
    # else 
    #   flash[:danger]="You have already sent a challenge request"
    end
    redirect_to team_path(@team)
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
           {:gamer_ids => []},:game_id  , :console_id,:game_id, :avatar )
    end

    def can_be_challenged
      @team=Team.find(params[:team_id] )
      if !gamer_can_challenge?(@team) 

          flash[:danger]="Not compatible game/console"
          redirect_to team_path(@team) 
      end
    end

end

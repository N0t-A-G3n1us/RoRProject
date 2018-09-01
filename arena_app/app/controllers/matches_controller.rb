class MatchesController < ApplicationController
  load_and_authorize_resource :team
  load_and_authorize_resource :match, through: :team
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
    
    @match= Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ############ NO CRUD 

  def ragequit 
    @team = Team.find_by_id(params[:team_id])
    @mat=Match.find_by_id(params[:match_id])
    if @team.nil? || current_gamer.team.nil?
      flash[:danger]="not found this team"
    elsif @mat.nil?
      flash[:danger]="not found this invite request"
    else
      @mat.update_attribute(:score,-1)
      @mat.update_attribute(:disputed, true)
      flash[:success]="RageQuitted"
      @team.matches.delete(@mat)
      
    end
    render :index
  end

  def register
    @team = Team.find_by_id(params[:team_id])
    @team=Challenge.find_by_id(params[:challenge_id])
    if @team.nil? || current_gamer.team.nil?
      flash[:danger]="not found this team"
    elsif existing_match?(@team,current_gamer.team)
      flash[:warning]="match already exists"
    elsif @cha.nil?
      flash[:danger]="not found this invite request"
    else
      flash[:success]="Removed challenge"
      @team.challenges.delete(@cha)
      @cha.destroy
    end
    render :index
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.fetch(:match, {})
    end
end

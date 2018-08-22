class ChallengesController < ApplicationController
  include ChallengesHelper
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    render :index
    
  end

  # # # # ## # # # # # NOT CRUD
 def accept
    @team = Team.find_by_id(params[:team_id])
    @cha=Challenge.find_by_id(params[:challenge_id])
    if @team.nil? || current_gamer.team.nil?
      flash[:danger]="not found this team"
    elsif @cha.nil?
      flash[:danger]="not found this invite request"
    else
      @team.matches.create(team_id: @team.id, matching_team_id: @cha.challenging_team.id)
      flash[:success]="Added match"
      @team.challenges.delete(@cha)
      @cha.destroy
    end
    render :index
  end

  def refuse
    @team = Team.find_by_id(params[:team_id])
    @cha=Challenge.find_by_id(params[:challenge_id])
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
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.fetch(:challenge,:challenge_id, {})
    end
end

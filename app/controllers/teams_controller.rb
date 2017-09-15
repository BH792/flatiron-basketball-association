class TeamsController < ApplicationController

  before_action :logged_in?

  def new
    @players = Player.all
    if User.find_by_id(session[:user_id]).teams.any?
      redirect_to user_path(session[:user_id])
    end
    @team = Team.new
    @team_player_ids = []
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = session[:user_id]
    if @team.save
      redirect_to user_path(session[:user_id])
    else
      flash[:message] = 'Enter a team name and select five players.'
      redirect_to new_team_path
    end
  end

  def edit
    @players = Player.all
    @team = Team.includes(:players).find_by_id(params[:id])
    @team_player_ids = @team.player_ids
  end

  def update
    @team = Team.find_by_id(params[:id])
    if @team.update(team_params)
      redirect_to user_path(session[:user_id])
    else
      @players = Player.all
      @team_player_ids = @team.player_ids
      flash.now[:message] = 'Enter a team name and select five players.'
      render 'edit'
    end
  end

  private

  def team_params
    params.require(:team).permit(
      :name,
      player_ids: []
      )
  end
end

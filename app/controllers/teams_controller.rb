class TeamsController < ApplicationController

  before_action :logged_in?

  def new
    @players = Player.all
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = session[:user_id]
    if @team.save
      redirect_to user_path(session[:user_id])
    else
      redirect_to new_team_path
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

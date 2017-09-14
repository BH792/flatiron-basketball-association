class GamesController < ApplicationController

  before_action :logged_in?

  def create
    @game = Game.new(date: Time.now)
    @home_team = Team.find_by(id: params[:team][:home_id])
    @away_team = Team.find_by(id: params[:team][:away_id])
    @game.simulate_game(@home_team.player_teams + @away_team.player_teams)
    @game.save
    redirect_to @game
  end

  def show
    @game = Game.find_by_id(params[:id])
    @home_team = @game.teams.uniq[0]
    @away_team = @game.teams.uniq[1]
    @home_appearances = @game.game_appearances_by_team(@home_team.id)
    @away_appearances = @game.game_appearances_by_team(@away_team.id)
  end

  def index
    @games = Game.all
    @leaderboard = Team.top_five_teams
  end

end

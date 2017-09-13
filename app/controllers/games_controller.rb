class GamesController < ApplicationController
  def create
    @game = Game.new(date: Time.now)
    @home_team = Team.find_by(id: params[:team][:home_id])
    @away_team = Team.find_by(id: params[:team][:away_id])
    @home_team.player_teams.each do |pt|
      Appearance.create(
        player_team: pt,
        game: @game,
        points: rand(5..15),
        rebounds: rand(5..15),
        assists: rand(5..15),
        steals: rand(5..15),
        blocks: rand(5..15),
      )
    end
    @away_team.player_teams.each do |pt|
      Appearance.create(
        player_team: pt,
        game: @game,
        points: rand(5..15),
        rebounds: rand(5..15),
        assists: rand(5..15),
        steals: rand(5..15),
        blocks: rand(5..15),
      )
      @game.save
    end
    redirect_to @game
  end

  def show
    @game = Game.find_by_id(params[:id])
    @home_team = Game.first.teams.uniq[0]
    @away_team = Game.first.teams.uniq[1]
  end

  def index
    @games = Game.all
  end

end

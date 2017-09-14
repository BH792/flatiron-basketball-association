class Game < ApplicationRecord
  has_many :appearances
  has_many :player_teams, through: :appearances
  has_many :teams, through: :player_teams
  has_many :players, through: :player_teams

  def total_points_by_team(team_id)
    sql = <<-SQL
    SELECT SUM(appearances.points)
    FROM games
    JOIN appearances on games.id = appearances.game_id
    JOIN player_teams on appearances.player_team_id = player_teams.id
    JOIN teams on player_teams.team_id = teams.id
    WHERE teams.id = #{team_id} AND games.id = #{self.id}
    SQL

    ActiveRecord::Base.connection.execute(sql)[0][0]
  end

  def simulate_game(player_teams)
    player_teams.each do |pt|
      Appearance.create(
        player_team: pt,
        game: self,
        points: rand(7..25),
        rebounds: rand(0..12),
        assists: rand(0..12),
        steals: rand(1..4),
        blocks: rand(1..4),
      )
    end
  end

end

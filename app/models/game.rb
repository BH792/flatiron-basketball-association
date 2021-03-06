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
    update_team_record
  end

  def update_team_record
    teams = self.teams.uniq
    team_one = teams[0]
    team_two = teams[1]
    team_one_pts = self.total_points_by_team(team_one.id)
    team_two_pts = self.total_points_by_team(team_two.id)
    if team_one_pts > team_two_pts
      team_one.wins +=1
      team_two.losses +=1
    elsif team_two_pts > team_one_pts
      team_two.wins +=1
      team_one.losses +=1
    end
    team_one.save
    team_two.save
  end

  def game_appearances_by_team(team_id)
    sql = <<-SQL
    SELECT appearances.*, players.name as player_name
    FROM games
    JOIN appearances on games.id = appearances.game_id
    JOIN player_teams on appearances.player_team_id = player_teams.id
    JOIN players on player_teams.id = players.id
    JOIN teams on player_teams.team_id = teams.id
    WHERE teams.id = ? AND games.id = ?
    SQL

    Appearance.find_by_sql([sql, team_id, self.id])
  end
end

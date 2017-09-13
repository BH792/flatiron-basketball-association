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

    # self.appearances.map do |app|
    #   if app.player_team.team.id == team_id
    #     app.points
    #   end
    # end
  end
end

[
  {
  "id"=>1,
  "date"=>"2017-09-13 15:53:57.893351",
  "points"=>14,
  "rebounds"=>13,
  "assists"=>6,
  "steals"=>10,
  "blocks"=>15,
  "game_id"=>1,
  "player_team_id"=>6,
  "player_id"=>1,
  "team_id"=>1,
  "name"=>"Jen's First Team",
  "user_id"=>1,
}
]

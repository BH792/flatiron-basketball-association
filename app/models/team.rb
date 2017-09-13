class Team < ApplicationRecord
  belongs_to :user
  has_many :player_teams
  has_many :players, through: :player_teams
  has_many :appearances, through: :player_teams
  has_many :games, through: :appearances
  validate :has_exactly_five_players

  def has_exactly_five_players
    if self.players.length != 5
      errors.add(:team_size, "A team must have five players.")
    end
  end


  def self.names
    sql = <<-SQL
    SELECT teams.name
    FROM teams
    SQL

    ActiveRecord::Base.connection.execute(sql).map { |x| x["name"]}
  end
end

class Team < ApplicationRecord
  belongs_to :user
  has_many :player_teams
  has_many :players, through: :player_teams
  has_many :appearances, through: :player_teams
  has_many :games, through: :appearances
  validate :has_exactly_five_players
  validates :name, presence: true, uniqueness: true, length: { maximum: 35 }

  def has_exactly_five_players
    if self.players.length != 5
      errors.add(:team_size, "A team must have five players.")
    end
  end

  def win_percentage
    wins + losses == 0 ? 0.00 : (wins.to_f / (wins + losses)).round(2)
  end

  def self.top_five_teams
    sql = <<-SQL
    SELECT (CAST(wins AS float) / (CAST(wins AS float) + CAST(losses AS float))) AS win_pct, name
    FROM teams
    ORDER BY win_pct DESC
    LIMIT 5
    SQL

    ActiveRecord::Base.connection.execute(sql)
    # returns array of hashes with key 0 being win_pct and 1 as team name
  end

  def self.names
    sql = <<-SQL
    SELECT teams.name
    FROM teams
    SQL

    ActiveRecord::Base.connection.execute(sql).map { |x| x["name"]}
  end
end

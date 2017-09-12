class Game < ApplicationRecord
  has_many :appearances
  has_many :player_teams, through: :appearances
  has_many :teams, through: :player_teams
  has_many :players, through: :player_teams
end

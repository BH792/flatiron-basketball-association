class User < ApplicationRecord
  has_many :teams
  has_many :player_teams, through: :teams
  has_many :players, through: :player_teams
  has_many :appearances, through: :player_teams
  has_many :games, through: :appearances

  has_secure_password
  validates :email, presence: true, uniqueness: true
end

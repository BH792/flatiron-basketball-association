class Team < ApplicationRecord
  has_many :players
  has_many :appearances, through: :players
  has_many :games, through: :appearances
end

class Game < ApplicationRecord
  has_many :appearances
  has_many :players, through: :appearances
  has_many :teams, through: :players
end

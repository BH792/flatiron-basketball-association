class Appearance < ApplicationRecord
  belongs_to :player_team
  belongs_to :game
end

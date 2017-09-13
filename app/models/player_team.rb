class PlayerTeam < ApplicationRecord
  belongs_to :player
  belongs_to :team
  has_many :appearances
end

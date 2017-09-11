class Player < ApplicationRecord
  belongs_to :team
  has_many :appearances
  has_many :games, through: :appearances
end

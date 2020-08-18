class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :board_game
  validates  :starting_date, :ending_date, presence: true
end

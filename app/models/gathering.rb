class Gathering < ApplicationRecord
  belongs_to :gamer
  belongs_to :group
  validates :game_cafe, presence: true
  validates :day_of_week, presence: true
  validates :group_id, presence: true
end

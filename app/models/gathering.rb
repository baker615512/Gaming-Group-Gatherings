class Gathering < ApplicationRecord
  belongs_to :gamer
  belongs_to :group
  validates :game_cafe, presence: true
  validates :day_of_week, presence: true
  validates :group_id, presence: true
  accepts_nested_attributes_for :group, reject_if: :all_blank
end

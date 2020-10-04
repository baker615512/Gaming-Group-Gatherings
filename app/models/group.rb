class Group < ApplicationRecord
    has_many :gatherings
    has_many :gamers, through: :gatherings
    validates :game_title, uniqueness: true, presence: true
    validates :game_category, presence: true
end

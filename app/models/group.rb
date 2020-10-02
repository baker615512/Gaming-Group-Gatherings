class Group < ApplicationRecord
    has_many :gatherings
    has_many :gamers, through: :gatherings
    validates :game_title, uniqueness: true, presence: true
    validates :game_category, presence: true

    scope :board_game, -> { where(game_category: "Board Game") }
    scope :card_game, -> { where(game_category: "Card Game") }
    scope :rpg, -> { where(game_category: "RPG") }
end

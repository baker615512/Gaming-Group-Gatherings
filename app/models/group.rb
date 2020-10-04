class Group < ApplicationRecord
    has_many :gatherings
    has_many :gamers, through: :gatherings
    validates :game_title, uniqueness: true, presence: true
    validates :game_category, presence: true

    def self.board_games
        where(game_category: 'Board Game')
    end

    def self.card_games
        where(game_category: 'Card Game')
    end

    def self.rpg
        where(game_category: 'RPG')
    end
end

class Group < ApplicationRecord
    has_many :gatherings
    has_many :gamers, through: :gatherings
end

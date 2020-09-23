class Gamer < ApplicationRecord
    has_many :gatherings
    has_many :groups, through: :gatherings
end

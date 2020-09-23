class Gamer < ApplicationRecord
    has_secure_password
    has_many :gatherings
    has_many :groups, through: :gatherings
end

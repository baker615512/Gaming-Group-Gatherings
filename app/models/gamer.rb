class Gamer < ApplicationRecord
    has_secure_password
    has_many :gatherings
    has_many :groups, through: :gatherings
    validates :username, uniqueness: true, presence: true

    def self.from_omniauth(auth)
        where(username: auth.info.email).first_or_initialize do |gamer|
            gamer.username = auth.info.email
            gamer.password = SecureRandom.hex
        end
    end
end

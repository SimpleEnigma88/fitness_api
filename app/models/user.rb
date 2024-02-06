class User < ApplicationRecord
    has_many :workouts

    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
    validates :password, presence: true, length: { maximum: 255 }
end

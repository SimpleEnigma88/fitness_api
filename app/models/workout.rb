class Workout < ApplicationRecord
    belongs_to :user

    validates :date, presence: true
    validates :name, presence: true, length: { maximum: 50 }
    validates :duration, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 240 }
    validate :total_duration_per_day
    validate :unique_name_per_day

    private

    def total_duration_per_day
        total_duration = user.workouts.where(date: date).sum(:duration)
        if total_duration + duration > 240
            errors.add(:duration, "Total workout duration in a day cannot exceed 240")
        end
    end

    def unique_name_per_day
        if user.workouts.where(date: date, name: name).exists?
            errors.add(:name, "You already have a workout with this name on this date")
        end
    end
end

class WorkingHour < ApplicationRecord
    # Validations
    validates :day, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
end

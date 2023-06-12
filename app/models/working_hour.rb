class WorkingHour < ApplicationRecord
    # Validations
    validates :day, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
  
    # Specify column types
    attribute :start_time, :time
    attribute :end_time, :time
  end
  
class Slot < ApplicationRecord
    # Validations
    validates :time, presence: true
    validates :car_type, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :is_disabled, inclusion: { in: [true, false] }
    validates :is_available, inclusion: { in: [true, false] }
    validates :cancelation_policy, presence: true
    validates :availability_start_time, presence: true, if: :is_available?
    validates :availability_end_time, presence: true, if: :is_available?
    
    def is_available?
      is_available == 'true'
    end
end

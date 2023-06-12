class Reservation < ApplicationRecord
  belongs_to :slot
  belongs_to :user
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :check_overlapping_slots

  def check_overlapping_slots
    if Reservation.exists?(user: user, start_time: start_time, end_time: end_time)
      errors.add(:base, "You have already booked a slot for this date and time.")
    end
  end
end

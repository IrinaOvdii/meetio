class Booking < ApplicationRecord
  belongs_to :room

  validates_uniqueness_of :start_time, :scope => [:day, :room_id]
  
  scope :booked_slots, -> (room_id, date) { where(room_id: room_id, day: date) }
end

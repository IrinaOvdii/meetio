class Room < ApplicationRecord
  has_many :bookings, dependent: :destroy

  def self.available(date)
    rooms_with_bookings_on_another_days = Room.where('rooms.id NOT IN (?)', Booking.where('day = ?', date).pluck(:room_id).uniq)

    b = Booking.arel_table
    group(:id)
      .left_joins(:bookings)
      .where(b[:id].eq(nil).or(b[:day].eq(Arel::Nodes.build_quoted(date))))
      .having((b[:id].count).lt(MAX_SPOTS_AMOUNT)) | rooms_with_bookings_on_another_days
  end

end

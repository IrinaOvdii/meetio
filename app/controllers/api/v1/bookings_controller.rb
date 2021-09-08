class Api::V1::BookingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def create
    room = Room.find_by_id(params[:room_id].to_i)
    date = params[:date].to_date
    start_times = params[:start_times]

    if room
      unless start_times.empty?
        new_bookings = []
        start_times.each do |start_time|
          end_time = Time.parse(start_time) + MIN_SPOT_DURATION

          booking = room.bookings.new
          booking.room_id = room.id
          booking.day = date
          booking.start_time = start_time
          booking.end_time = end_time
          booking.user_email = LOGGED_USER_EMAIL

          if booking.save
            new_bookings << booking
          else
            new_bookings << "#{booking.errors.messages}"
          end
        end

        result = {
          bookings: []
        }

        new_bookings.each do |booking|
          result[:bookings] << {
            id: booking.id,
            day: booking.day,
            start_time: booking.start_time.strftime("%H:%M"),
            end_time: booking.end_time.strftime("%H:%M"),
            user_email: booking.user_email,
            note: booking.note,
            room_id: booking.room_id,
          }
        end
        render_success result
      end

    else
      render_error "Room was not found."
    end
  end

end

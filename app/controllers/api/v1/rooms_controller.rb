class Api::V1::RoomsController < Api::V1::BaseController

  def all_rooms_availability
    day = params[:date].present? ? params[:date].to_date : Date.today
    available_rooms = Room.available(day)

    result = {
      rooms: []
    }
    available_rooms.each do |room|
      result[:rooms] << {
        id: room.id,
        title: room.title,
        picture: room.picture,
        capacity: room.capacity,
      }
    end

    render_success result
  end

  def room_availability
    return render_error('Date is not provided.', '', 400) unless params[:date]
    return render_error('room_id is not provided.', '', 400) unless params[:room_id]

    day = params[:date].to_date
    room_id = params[:room_id]
    room = Room.find_by_id(params[:room_id].to_i)

    if room
      booked_start_times = Booking.booked_slots(room_id, day).pluck(:start_time).map{|time| time.strftime("%H:%M")}

      available_start_times = ALL_START_TIMES - booked_start_times

      result = {}
      result[:available_start_times] = available_start_times
      result[:booked_start_times] = booked_start_times

      render_success result
    else
      render_error('Room was not found.', '', 400)
    end

  end

end

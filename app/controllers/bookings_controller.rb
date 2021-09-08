class BookingsController < ApplicationController
  before_action :set_room

  def index
    @bookings = @room.bookings
  end

  def new
    @booking = @room.bookings.new
  end

  def create
    @booking = @room.bookings.new(booking_params)
      if @booking.save
        redirect_to room_bookings_path(@room), notice: "Thanks for your booking!"
      else
        render :new
      end
  end

  private
  def booking_params
    params.required(:booking).permit(:day, :start_time, :end_time, :user_email, :note)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end

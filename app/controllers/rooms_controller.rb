class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    redirect_to '/api/v1/all_rooms_availability'
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room, notice: "Room successfully updated!"
    else
      render :edit
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room, notice: 'Room successfully created!'
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url, alert: "Room successfully deleted!"
  end

  private

  def room_params
    params.require(:room).
      permit(:title, :picture, :capacity)
  end
end

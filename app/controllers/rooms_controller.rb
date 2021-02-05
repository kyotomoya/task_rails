class RoomsController < ApplicationController
  def index
    #@rooms = Room.all
    @rooms = Room.search(params[:search])
  end
  def new
    @user = current_user
    
    @room = Room.new
  end

  def create
    @user = current_user
    
    @room = Room.new(params.require(:room).permit(:id, :room_name, :room_text, :room_price, :room_address, :room_image, :user_id))
    
    if @room.save
      #binding.pry
      flash[:notice] = "ルームを新規登録しました"
      redirect_to @room
    else 
      render "new"
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
    #@reservations = Reservation.all
   # @reservation = Reservation.new 
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if 
      @room.update(params.require(:room).permit(:room_name, :room_text, :room_price, :start_date, :end_date, :people, :total_price, :room_day, :room_image))
      @room.room_day = ((@room.end_date - @room.start_date) / 86400)
      #sd = @room.start_date.to_i
      #ed = @room.end_date.to_i
      #@room.room_day = ed - sd
      @room.total_price = @room.room_price * @room.people * @room.room_day
      redirect_to new_reservation_path(@room)
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :rooms
  end
end

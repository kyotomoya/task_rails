class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    #@rooms.id = @reservations.room_id
    #binding.pry
  end
  def new
    @user = current_user
    @reservation = Reservation.new
    @room = Room.find_by(id: params[:format])
    @room.room_day = ((@room.end_date - @room.start_date) / 86400)
    @room.total_price = @room.room_price * @room.people * @room.room_day
   # binding.pry
  end
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.new
    @room.id = @reservation.room_id
    @room = Room.find(@room.id)
    @room.room_day = ((@room.end_date - @room.start_date) / 86400)
    @room.total_price = @room.room_price * @room.people * @room.room_day
    #binding.pry
  end
  def create
    @user = current_user
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :people, :user_id, :room_id, :name, :price, :text, :image))
    @room = Room.find_by(id: @reservation.room_id)
    @reservation.user_id = @user.id
    @room.room_day = ((@room.end_date - @room.start_date) / 86400)
    @room.total_price = @room.room_price * @room.people * @room.room_day
    @reservation.name = @room.room_name
    @reservation.price = @room.total_price
    @reservation.text = @room.room_text
    #@reservation.iamge = @room.room_image
    #binding.pry
    #@room = Room.find_by(id: params[:room_id])
    #@room = Room.find_by(id: params[:format])
    if @reservation.save
      
      flash[:notice] = "予約確認"
      redirect_to @reservation
    else 
      render "new"
    end
  end
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "ルーム予約を削除しました"
    redirect_to :reservations
  end
  private

  #def reservation_params
   # params.require(:reservation).parmit(:start_date, :end_date, :people)
 # end
  #def room_params
    #params.require(:room).parmit(:room_id)
  #end
  
end

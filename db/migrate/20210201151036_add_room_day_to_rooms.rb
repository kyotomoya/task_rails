class AddRoomDayToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_day, :integer
  end
end

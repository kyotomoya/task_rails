class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :room_name
      t.text :room_text
      t.integer :room_price
      t.string :room_address

      t.timestamps
    end
  end
end

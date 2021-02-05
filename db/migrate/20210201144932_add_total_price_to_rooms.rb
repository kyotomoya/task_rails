class AddTotalPriceToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :total_price, :integer
  end
end

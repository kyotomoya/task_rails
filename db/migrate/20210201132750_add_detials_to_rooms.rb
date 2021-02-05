class AddDetialsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :start_date, :datetime
    add_column :rooms, :end_date, :datetime
    add_column :rooms, :people, :integer
  end
end

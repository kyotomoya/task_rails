class AddDateilsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :name, :string
    add_column :reservations, :price, :integer
    add_column :reservations, :text, :string
    add_column :reservations, :image, :string
  end
end

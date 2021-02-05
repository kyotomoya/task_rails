class Room < ApplicationRecord
  has_many :users, through: :reservations
  
  validates :room_name, presence: true
  validates :room_text, presence: true, length: { in: 4..50 }
  validates :room_price, presence: true, numericality: true
  validates :room_address, presence: true
  
  mount_uploader :room_image, ImageUploader
  has_many :reservations
  def self.search(search)
    if search
      Room.where(['room_name LIKE ? OR room_text LIKE ? OR room_price LIKE ? OR room_address LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Room.all
    end
  end
end

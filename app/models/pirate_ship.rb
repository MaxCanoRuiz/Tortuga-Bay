class PirateShip < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many_attached :pictures

  validates :name, :description, presence: true, uniqueness: true

end

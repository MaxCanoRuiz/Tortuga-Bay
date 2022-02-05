class PirateShip < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many_attached :pictures

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

end

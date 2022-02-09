class PirateShip < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many_attached :pictures

  geocoded_by :port
  after_validation :geocode, if: :will_save_change_to_port?

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

end

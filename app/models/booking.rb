class Booking < ApplicationRecord
  attr_accessor :password

  belongs_to :pirate_ship
  belongs_to :user

  validates :status, :start_date, :end_date, presence: true
end

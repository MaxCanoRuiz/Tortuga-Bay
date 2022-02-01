class Booking < ApplicationRecord
  belongs_to :pirate_ship
  belongs_to :user
end

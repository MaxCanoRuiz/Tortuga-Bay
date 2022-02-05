class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pirate_ships
  has_many :bookings
  has_many :rented_ships, through: :bookings, source: :pirate_ship


  validates :email, format: { with: /\A.*@.*\.com\z/ }

end

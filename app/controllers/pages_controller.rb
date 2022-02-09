class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  include Pundit
  def home
  end

  def dashboard
    @user = current_user
    @name = current_user.name || "you incog'ito matey"
    @pending_bookings = current_user.bookings.select { |booking| booking.status == "pending" }
    @confirmed_bookings = current_user.bookings.select { |booking| booking.status == "confirmed" }
    @owned_ships = current_user.pirate_ships
  end
end

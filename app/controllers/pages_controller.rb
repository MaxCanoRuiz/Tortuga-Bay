class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @name = current_user.name || "you incog'ito matey"
    @pending_ships = current_user.bookings.select { |booking| booking.status == "pending" }.map(&:pirate_ship)
    @confirmed_bookings = current_user.bookings.select { |booking| booking.status == "confirmed" }
  end

end

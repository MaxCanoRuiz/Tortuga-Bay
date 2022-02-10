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
    @pending_requests = Booking.where(status: "pending").select { |booking| booking.pirate_ship.user_id == current_user.id}
    @confirmed_requests = Booking.where(status: "confirmed").select { |booking| booking.pirate_ship.user_id == current_user.id}
    @rejected_requests = Booking.where(status: "rejected").select { |booking| booking.pirate_ship.user_id == current_user.id}
  end

  def accept
    booking = Booking.find(params[:id])
    booking.status = "accepted"
    booking.save
    redirect_to dashboard_path
  end

  def reject
    booking = Booking.find(params[:id])
    booking.status = "rejected"
    booking.save
    redirect_to dashboard_path
  end

  def map
    @pirate_ships = PirateShip.all
    @markers = @pirate_ships.geocoded.map do |pirate_ship|
      {
        lat: pirate_ship.latitude,
        lng: pirate_ship.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pirate_ship: pirate_ship }),
        image_url: helpers.asset_url('harbor.svg')
      }
    end
  end

  private

  def pages_params
    params.permit(:id)
  end
end

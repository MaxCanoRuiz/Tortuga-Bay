class BookingsController < ApplicationController
  include Pundit
  before_action :find_pirate_ship, only: [:new, :create]
  after_action :verify_authorized, except: [:new, :create, :edit, :show]

  def show
    @booking = Booking.find(params[:id])

  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pirate_ship = @pirate_ship
    @booking.status = "pending"
    @booking.user = current_user
    if @booking.save
      redirect_to pirate_ship_booking_path(@pirate_ship.id, @booking)
    else
      render :new
    end
  end

private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :user_id, :pirate_ship_id)
  end

  def find_pirate_ship
    @pirate_ship = PirateShip.find(params[:pirate_ship_id])
  end
end

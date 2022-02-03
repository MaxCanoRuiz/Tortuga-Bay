class PirateShipsController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: [:new, :create]

  def new
    @pirate_ship = PirateShip.new
  end

  def create
    @pirate_ship = PirateShip.new(pirate_ship_params)
    if @pirate_ship.save
      redirect_to pirate_ship_path(@pirate_ship)
    else
      render :new
    end
  end

  private

  def pirate_ship_params
    params.require(:pirate_ship).permit(:name, :description, :type, :capacity,
                                        :number_of_canons, :port, :country, :picture)
  end
end

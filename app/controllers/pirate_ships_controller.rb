class PirateShipsController < ApplicationController

  def show
    @pirate_ship = PirateShip.find(params[:id])
  end

end

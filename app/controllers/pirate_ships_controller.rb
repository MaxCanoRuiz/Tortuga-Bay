class PirateShipsController < ApplicationController
  include Pundit
  after_action :verify_authorized, except: [:new, :create]

  def new
    @pirate_ship = PirateShip.new
  end

  def create
    @pirate_ship = PirateShip.new(pirate_ship_params)
    if @pirate_ship.save
      redirect_to pirate_ships_path(@pirate_ship)
    else
      render :new
    end
  end

  def edit
    @pirate_ship = PirateShip.find(params[:id])
  end


  private

  def pirate_ship_params
    params.require(:pirate_ship).permit(:name, :description, :type, :capacity, :parrot_friendlyness,
                                        :number_of_canons, :port, :country, :picture)
  end
end

class PirateShipsController < ApplicationController

  include Pundit
  after_action :verify_authorized, except: [:show]

  def show
    @pirate_ship = PirateShip.find(params[:id])
  end

end

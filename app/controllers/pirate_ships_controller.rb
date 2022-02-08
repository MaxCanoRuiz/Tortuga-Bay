class PirateShipsController < ApplicationController
  include Pundit
  before_action :authenticate_user!, except: [:index, :show]
  after_action :verify_authorized, except: [:index, :new, :create, :edit, :show]

  def index
    @pirate_ships = policy_scope(PirateShip).order(created_at: :desc)
    #@pirate_ships = PirateShip.all
  end

  def show
    @pirate_ship = PirateShip.find(params[:id])
  end

  def new
    @pirate_ship = PirateShip.new
  end

  def create
    @pirate_ship = PirateShip.new(pirate_ship_params)
    @pirate_ship.user = current_user
    if @pirate_ship.save
      redirect_to pirate_ship_path(@pirate_ship)
    else
      render :new
    end
  end

  def edit
    @pirate_ship = PirateShip.find(params[:id])
  end


  private

  def pirate_ship_params
    params.require(:pirate_ship).permit(:name, :description, :ship_type, :capacity, :parrot_friendlyness,
                                        :number_of_canons, :port, :country, pictures: [])
  end
end

class PirateShipsController < ApplicationController
  include Pundit
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pirate_ship, only: [:show, :edit, :update]
  after_action :verify_authorized, except: [:index, :new, :create, :edit, :show, :update]

  def index
    @pirate_ships = policy_scope(PirateShip).order(created_at: :desc)
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query OR country ILIKE :query"
      @pirate_ships = PirateShip.where(sql_query, query: "%#{params[:query]}%")
    else
      @pirate_ships = PirateShip.all
    end
  end

  def show
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
  end

  def update
    @pirate_ship.update(pirate_ship_params)

    redirect_to pirate_ships_path(@pirate_ship)
  end

  private

  def set_pirate_ship
    @pirate_ship = PirateShip.find(params[:id])
  end


  def pirate_ship_params
    params.require(:pirate_ship).permit(:name, :description, :ship_type, :capacity, :parrot_friendlyness,
                                        :number_of_canons, :port, :country, pictures: [])
  end
end

class AddCoordinatesToPirateShip < ActiveRecord::Migration[6.1]
  def change
    add_column :pirate_ships, :latitude, :float
    add_column :pirate_ships, :longitude, :float
  end
end

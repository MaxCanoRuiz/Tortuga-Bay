class AddPictureToPirateShip < ActiveRecord::Migration[6.1]
  def change
    add_column :pirate_ships, :picture, :string
  end
end

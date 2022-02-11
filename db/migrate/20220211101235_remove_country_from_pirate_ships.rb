class RemoveCountryFromPirateShips < ActiveRecord::Migration[6.1]
  def change
    remove_column :pirate_ships, :country, :string
  end
end

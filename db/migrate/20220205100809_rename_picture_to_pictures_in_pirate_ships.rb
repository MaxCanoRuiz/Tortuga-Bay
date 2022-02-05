class RenamePictureToPicturesInPirateShips < ActiveRecord::Migration[6.1]
  def change
    rename_column :pirate_ships, :picture, :pictures
  end
end

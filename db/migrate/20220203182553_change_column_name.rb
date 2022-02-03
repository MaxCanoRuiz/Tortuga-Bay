class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column(:pirate_ships, :type, :ship_type)
  end
end

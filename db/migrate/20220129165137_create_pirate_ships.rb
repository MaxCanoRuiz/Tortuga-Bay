class CreatePirateShips < ActiveRecord::Migration[6.1]
  def change
    create_table :pirate_ships do |t|
      t.integer :parrot_friendlyness
      t.string :name
      t.text :description
      t.string :type
      t.integer :capacity
      t.integer :number_of_canons
      t.string :port
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

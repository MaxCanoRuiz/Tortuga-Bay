# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'csv'
require 'faker'

puts 'empty last seed'
User.destroy_all
PirateShip.destroy_all

puts 'create new seed'
pirate_names = []
pirate_pictures = []
ship_names = []
ship_pictures = []
CSV.foreach('db/Tortuga_pirate_names.csv') { |name| pirate_names += name }
CSV.foreach('db/Tortuga_pirate_pictures.csv') { |picture| pirate_pictures += picture }
CSV.foreach('db/Tortuga_ship_names.csv') { |name| ship_names += ["The #{name[0]}"] }
CSV.foreach('db/Tortuga_ship_pictures.csv') { |picture| ship_pictures += picture }
pirate_names.shift
pirate_pictures.shift
ship_names.shift
ship_pictures.shift
pirate_names.shuffle!
pirate_pictures.shuffle!
ship_names.shuffle!
ship_pictures.shuffle!

(0...30).each do |index|
  pirate = User.create!(name: pirate_names[index],
                        avatar_url: pirate_pictures[index],
                        email: Faker::Internet.email,
                        password: 'password')
  puts 'test pirate'
  ship = PirateShip.create!(name: ship_names[index],
                            picture: ship_pictures[index],
                            parrot_friendlyness: Random.rand(0..10),
                            user_id: pirate[:id])
  puts 'test ship'
  booking = Booking.create!(pirate_ship_id: ship[:id],
                            user_id: pirate[:id],
                            status: 'pending')
  puts "pirate created: #{booking.user.name} who has a ship named: #{booking.pirate_ship.name}"
end

puts 'seeding process finished'

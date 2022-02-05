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
Booking.destroy_all
PirateShip.destroy_all
User.destroy_all

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
  puts "created #{pirate.name}"
end
puts '---------------pirates created---------------'

(0...30).each do |index|
  ship = PirateShip.create!(name: ship_names[index],
                            parrot_friendlyness: Random.rand(0..10),
                            user_id: User.all.sample[:id],
                            description: "an awesome ship matey, you'll loooove it.",
                            ship_type: %w[barge galley galleon skiff steamer dreadnaught].sample,
                            capacity: Random.rand(22..89),
                            number_of_canons: Random.rand(12..675),
                            port: Faker::Address.city,
                            country: Faker::Address.country)
  file = URI.open(ship_pictures[index])
  ship.pictures.attach(io: file, filename: "my_ship.jpg", content_type: 'image/png')
  puts "created #{ship.name} owned by #{ship.user.name}"
end
puts '---------------ships created---------------'

(0...60).each do
  booking = Booking.create!(pirate_ship_id: PirateShip.all.sample[:id],
                            user_id: User.all.sample[:id],
                            status: %w[pending confirmed rejected].sample)
  puts "booking by: #{booking.user.name} who has rented: #{booking.pirate_ship.name} with status #{booking.status}"
end
puts '---------------bookings created---------------'

puts 'seeding process finished'

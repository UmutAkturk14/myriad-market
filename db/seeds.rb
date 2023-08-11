# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

# TODO: Seed users

puts "Seeding users"
# 20.times do
#   puts "User..."
#   file = URI.open("https://source.unsplash.com/random?people-close-up")
#   user = User.create(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password,
#     full_name: Faker::Name.name,
#     username: Faker::Internet.username.gsub(/[^a-zA-Z0-9]/, '')
#   )
#   user.profile_photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# end

# TODO: Seed properties
# 20.times do
#   puts "Property..."
#   file = URI.open("https://source.unsplash.com/random?properties")
#   property = Property.create(
#     property_type: Property::ARCHITECTURAL_PROPERTIES.sample,
#     bedrooms: (1..6).to_a.sample,
#     bathrooms: (1..3).to_a.sample,
#     square_feet: (60..200).to_a.sample,
#     age: (1..20).to_a.sample,
#     floor: (1..4).to_a.sample,
#     price: (100000..1000000).to_a.sample,
#     address: Faker::Address.full_address,
#     city: Faker::Address.city,
#     state: Faker::Address.country,
#     description: Faker::Lorem.paragraph(sentence_count: 1)
#   )
#   property.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
# end

# TODO: Seed vehicles
20.times do
  puts "Vehicle..."
  file = URI.open("https://source.unsplash.com/random?old-cars")
  vehicle = Vehicle.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    full_name: Faker::Name.name,
    username: Faker::Internet.username.gsub(/[^a-zA-Z0-9]/, '')
  )
  vehicle.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
end
# TODO: Seed services
20.times do
  puts "Service..."
  file = URI.open("https://source.unsplash.com/random?services")
  service = Service.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    full_name: Faker::Name.name,
    username: Faker::Internet.username.gsub(/[^a-zA-Z0-9]/, '')
  )
  service.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
end

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
5.times do
  puts "User..."
  file = URI.open("https://source.unsplash.com/random?people-close-up")
  user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    full_name: Faker::Name.name,
    username: Faker::Internet.username.gsub(/[^a-zA-Z0-9]/, ''),
    account_type: ["Personal", "Institutional"].sample,
    phone_number_visible: [true, false].sample,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    about: Faker::Lorem.sentences(number: 5).join(" "),
    city: Faker::Address.city,
    country: Faker::Address.country,
    address_visible: [true, false].sample,
    status: "user"
  )
  user.profile_photo.attach(io: file, filename: "nes.png", content_type: "image/png")
end

# TODO: Seed properties
5.times do
  puts "Property..."
  file = URI.open("https://source.unsplash.com/random?properties")
  property = Property.create(
    property_type: Property::ARCHITECTURAL_PROPERTIES.sample,
    bedrooms: (1..6).to_a.sample,
    bathrooms: (1..3).to_a.sample,
    square_feet: (60..200).to_a.sample,
    age: (1..20).to_a.sample,
    floor: (1..4).to_a.sample,
    price: (100000..1000000).to_a.sample,
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    state: Faker::Address.country,
    description: Faker::Lorem.paragraph(sentence_count: 1),
    user: User.all.sample
  )
  property.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
end

# TODO: Seed vehicles
5.times do
  puts "Vehicle..."
  file = URI.open("https://source.unsplash.com/random?old-cars")
  vehicle = Vehicle.create(
      vehicle_type: Vehicle::VEHICLE_TYPES.sample,
      make: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      year: (1950..2023).to_a.sample,
      mileage: (0..100).to_a.sample*1000,
      price: (0..100).to_a.sample*1000,
      fuel_type: Faker::Vehicle.fuel_type,
      transmission: Faker::Vehicle.transmission,
      description: Faker::Lorem.paragraphs(number: 3),
      user: User.all.sample
    )
  vehicle.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
end
# TODO: Seed services
5.times do
  puts "Service..."
  file = URI.open("https://source.unsplash.com/random?services")
  service = Service.create(
    service_type: Service::SERVICES.sample,
    title: Faker::Lorem.words,
    hourly_rate: (1..25).to_a.sample * 20,
    location: Faker::Address.city,
    description: Faker::Lorem.paragraphs(number: 3),
    user: User.all.sample
  )
  service.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
end


Vehicle.all.each do |v|
  Offer.create!(offerable: v, up_for: ["Sale", "Loan"].sample, user: User.all.sample, is_available: [true, false].sample)
end
Property.all.each do |v|
  Offer.create!(offerable: v, up_for: ["Sale", "Loan"].sample, user: User.all.sample, is_available: [true, false].sample)
end
Service.all.each do |v|
  Offer.create!(offerable: v, up_for: ["Sale", "Loan"].sample, user: User.all.sample, is_available: [true, false].sample)
end

Offer.all.each do |o|
  o.title = Faker::Lorem.paragraph
  o.address = o.user.city
  o.save!
end

# 3.times do
#   puts "adding photo..."
#   file = URI.open("https://source.unsplash.com/random?old-cars")
#   vehicle = Vehicle.find(6)
#   vehicle.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
# end

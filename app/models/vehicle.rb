class Vehicle < ApplicationRecord
  has_many :offers, as: :offerable
  has_many_attached :photos
  belongs_to :user

  # Vehicle types to use in forms
  VEHICLE_TYPES = [
    "Car",
    "Truck",
    "SUV",
    "Motorcycle",
    "Scooter",
    "Bicycle",
    "RV",
    "Boat",
    "Jet Ski",
    "Snowmobile",
    "ATV",
    "Golf Cart",
    "Electric Scooter",
    "Segway",
    "Moped",
    "Go-Kart",
    "Trailer",
    "Bus",
    "Van",
    "Helicopter",
    "Airplane",
    "Hoverboard",
    "Electric Skateboard",
    "Submarine",
    "Spacecraft"
  ]

  VEHICLE_MAKE = [
    "Toyota",
    "Ford",
    "Volkswagen",
    "Honda",
    "General Motors (Chevrolet, GMC, Cadillac)",
    "Nissan",
    "Hyundai",
    "Mercedes-Benz",
    "BMW",
    "Audi",
    "Volvo",
    "Kia",
    "Mitsubishi",
    "Subaru",
    "Porsche",
    "Fiat",
    "Tesla",
    "Jaguar",
    "Land Rover",
    "Lexus",
    "Mazda",
    "Chrysler",
    "Dodge",
    "Jeep",
    "Ram",
    "Ferrari",
    "Lamborghini",
    "Bugatti",
    "McLaren",
    "Rolls-Royce",
    "Bentley",
    "Aston Martin",
    "Maserati",
    "Alfa Romeo",
    "Mini",
    "Genesis"
  ]


  validates :vehicle_type, :make, :model, :year, :mileage, :price, :fuel_type, :transmission, :description, :user, presence: true
  validates :vehicle_type, inclusion: { in: VEHICLE_TYPES }

end

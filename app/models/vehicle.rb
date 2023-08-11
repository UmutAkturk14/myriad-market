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

  validates :vehicle_type, :make, :model, :year, :mileage, :price, :fuel_type, :transmission, :description, :user, presence: true
  validates :vehicle_type, inclusion: { in: VEHICLE_TYPES }
end

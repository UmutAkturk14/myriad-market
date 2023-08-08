class Vehicle < ApplicationRecord
  has_many :offers, as: :offerable

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
end

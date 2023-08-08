class Property < ApplicationRecord
  has_many :offers, as: :offerable

  validates :property_type, :bedrooms, :bathrooms, :square_feet, :price, :address, :city, :state, presence: true
  validates :bedrooms, :bathrooms, :square_feet, :age, :floor, numericality: { only_integer: true }
  validates :price, numericality: true
  validates :property_type, inclusion: { in: ['House', 'Apartment', 'Mansion', '...'] }
  validates :floor, inclusion: { in: 1..100 }
  validates :zip_code, format: { with: /\A\d{5}(-\d{4})?\z/, message: "should be in the format 12345 or 12345-6789" }

  # Property types to use in forms
  ARCHITECTURAL_PROPERTIES = [
    "House",
    "Apartment",
    "Mansion",
    "Cottage",
    "Villa",
    "Condo",
    "Townhouse",
    "Cabin",
    "Loft",
    "Studio",
    "Bungalow",
    "Penthouse",
    "Chalet",
    "Duplex",
    "Triplex",
    "Castle",
    "Chateau",
    "Farmhouse",
    "Ranch",
    "Igloo",
    "Treehouse",
    "Yurt",
    "Boat House",
    "Lighthouse",
    "Igloo",
    "Hobbit House",
    "Container Home",
    "Earthship",
    "Tiny House",
    "Windmill",
    "Geodesic Dome",
    "Cave House",
    "Palace"
  ].sort
end

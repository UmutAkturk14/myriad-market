class Property < ApplicationRecord
  has_many :offers, as: :offerable
  has_many_attached :photos
  belongs_to :user

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
    "Hobbit House",
    "Container Home",
    "Earthship",
    "Tiny House",
    "Windmill",
    "Geodesic Dome",
    "Cave House",
    "Palace"
  ]
  validates :property_type, :bedrooms, :bathrooms, :square_feet, :price, :address, :city, :state, :floor, :age, :description, :user, presence: true
  validates :bedrooms, :bathrooms, :square_feet, :age, :floor, numericality: { only_integer: true }
  validates :price, numericality: true
  validates :property_type, inclusion: { in: ARCHITECTURAL_PROPERTIES }
  validates :floor, inclusion: { in: 1..100 }
end

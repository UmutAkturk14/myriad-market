class Service < ApplicationRecord
  has_many :offers, as: :offerable
  has_many_attached :photos
  belongs_to :user

  # Service types to use in forms
  SERVICES = [
    "Babysitting",
    "Petsitting",
    "Housesitting",
    "Tutoring",
    "House Cleaning",
    "Landscaping",
    "Plumbing",
    "Electrician",
    "Painting",
    "Carpentry",
    "Web Development",
    "Graphic Design",
    "Writing",
    "Translation",
    "Photography",
    "Videography",
    "Cooking / Catering",
    "Personal Training",
    "Yoga Instruction",
    "Life Coaching",
    "Event Planning",
    "Music Lessons",
    "Art Lessons",
    "Dance Lessons",
    "Language Lessons",
    "Fitness Coaching",
    "Tech Support",
    "Consulting",
    "Marketing Services",
    "Online Tutoring",
    "Data Entry",
    "Virtual Assistance",
    "Social Media Management",
    "Resume Writing",
    "Editing / Proofreading",
    "Interior Design",
    "Legal Services",
    "Financial Consulting"
  ].sort

  validates :service_type, :title, :hourly_rate, :location, :description, :user, presence: true


end

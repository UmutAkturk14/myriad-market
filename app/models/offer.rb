class Offer < ApplicationRecord
  belongs_to :offerable, polymorphic: true
  belongs_to :user

  validates :up_for, inclusion: { in: ["Sale", "Loan"] }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

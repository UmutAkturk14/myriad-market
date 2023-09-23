class Offer < ApplicationRecord
  belongs_to :offerable, polymorphic: true
  belongs_to :user
  include PgSearch::Model

  validates :up_for, inclusion: { in: ["Sale", "Loan", "Not specified"] }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

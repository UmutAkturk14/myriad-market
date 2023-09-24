class Offer < ApplicationRecord
  belongs_to :offerable, polymorphic: true
  belongs_to :user

  # PG Search
  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis,
  against: [ :offerable_type, :up_for, :title, :address ],
  associated_against: {
    user: [:full_name, :username]
  },
  using: {
    tsearch: { prefix: true }
  }


  validates :up_for, inclusion: { in: ["Sale", "Loan", "Not specified"] }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

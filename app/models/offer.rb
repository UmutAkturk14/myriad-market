class Offer < ApplicationRecord
  belongs_to :offerable, polymorphic: true

  validates :up_for, inclusion: { in: ["Sale", "Loan"] }
end

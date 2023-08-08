class Offer < ApplicationRecord
  belongs_to :offerable, polymorphic: true
end

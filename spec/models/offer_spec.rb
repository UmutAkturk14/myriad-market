require 'rails_helper'

RSpec.describe Offer, :offer, type: :model do

  describe 'validations' do
    it do
      should validate_inclusion_of(:up_for).
      in_array(["Sale", "Loan"])
    end
  end

  describe 'associations' do
    it { should belong_to(:offerable) }
  end
end

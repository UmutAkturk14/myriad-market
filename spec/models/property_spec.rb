require 'rails_helper'

RSpec.describe Property, :property, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:property_type) }
    it { should validate_presence_of(:bedrooms) }
    it { should validate_presence_of(:bathrooms) }
    it { should validate_presence_of(:square_feet) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:floor) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should have_many(:offers) }
  end
end

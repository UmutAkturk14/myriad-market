require 'rails_helper'

RSpec.describe Vehicle, :vehicle, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:vehicle_type) }
    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:mileage) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:fuel_type) }
    it { should validate_presence_of(:transmission) }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:offers) }
  end
end

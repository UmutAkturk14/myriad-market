require 'rails_helper'

RSpec.describe Service, :service, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:service_type) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:hourly_rate) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:offers) }
  end
end

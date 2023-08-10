require 'rails_helper'

RSpec.describe Offer, :offer, type: :model do
  it 'has some behaviour' do
    pending
  end

  it { should belong_to(:offerable) }
end

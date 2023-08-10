require 'rails_helper'

RSpec.describe User, :user, type: :model do
  it 'has a valid user' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'should have a valid password' do
    # Password can't be blank
    user = build(:user, password: nil)
    expect(user).to be_invalid
  end

  it "can't have a password consisted of only numbers" do
    user = build(:user, password: "53629102")
    expect(user).to be_invalid
  end

  it "can't have a password consisted of only numbers and lowcase letters" do
    user = build(:user, password: "5362ewqr")
    expect(user).to be_invalid
  end

  it "can't have a password consisted of only numbers and upcase letters" do
    user = build(:user, password: "5362QWEQJI")
    expect(user).to be_invalid
  end

  it "can't have a password consisted of only downcase and upcase letters" do
    user = build(:user, password: "WQWKjfdsaop")
    expect(user).to be_invalid
  end

  describe "#symbolise_country" do
    it 'symbolises the country' do
      user = build(:user)
      user_country = user.country
      expect(user.symbolise_country).to eq(CS.countries.key(user_country))
    end

  end

end

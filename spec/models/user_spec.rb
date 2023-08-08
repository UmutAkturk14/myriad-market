require 'rails_helper'

RSpec.describe User, :user, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'should have a valid email' do
    expect(User.new(email: "john@example.com", password: "123456Aowerjq", full_name: "John Doe", username: "SomeUsername").valid?).to eq(true)
    expect(User.new(email: "john123@example.com", password: "123456Aowerjq", full_name: "John Doe", username: "SomeUsername").valid?).to eq(true)
    expect(User.new(email: "john@example@example.com", password: "123456Aowerjq", full_name: "John Doe", username: "SomeUsername").valid?).to eq(false)
    expect(User.new(email: "Jowqhn@example.com", password: "123456Aowerjq", full_name: "John Doe", username: "SomeUsername").valid?).to eq(true)
  end

  it 'should have a valid password' do
    expect(User.new(email: "john@example.com", password: "123456Aowerjq", full_name: "John Doe", username: "SomeUsername").valid?).to eq(true)
    expect(User.new(email: "john@example.com", password: "1234", full_name: "John Doe").valid?).to eq(false)
    expect(User.new(email: "john@example.com", password: "1235432643276", full_name: "John Doe").valid?).to eq(false)
    expect(User.new(email: "john@example.com", password: "kasdokopwqjtiewq", full_name: "John Doe").valid?).to eq(false)
    expect(User.new(email: "john@example.com", password: "213214fsadpojfioew", full_name: "John Doe").valid?).to eq(false)
    expect(User.new(email: "john@example.com", password: "12321312KQWOEWQ", full_name: "John Doe").valid?).to eq(false)
  end

  it 'should have a full name' do
    expect(User.new(email: "john@example.com", password: "123456Aowerjq", full_name: "John Doe", username: "SomeUsername").valid?).to eq(true)
    expect(User.new(email: "john@example.com", password: "123456Aowerjq", username: "SomeUsername").valid?).to eq(false)
  end

  it 'should have a unique username' do
    User.create(email: "john@example.com", password: "123456Aowerjq", full_name: "John Doe", username: "SomeUsername")
    expect(User.new(email: "john@example.com", password: "123456Aowerjq", full_name: "John Doe", username: "SomeUsername").valid?).to eq(false)
  end

  # TODO: If the user has a phone number, it gets validated
  # TODO: If the user has an addres, it gets geolocated
end


RSpec.describe Item, :item, type: :model do


  # TODO: It should have an item type
  # TODO: It should have a title
  # TODO: It should have a description
  # TODO: It should have a price
  # TODO: It should have an owner as a user
  # TODO: It should have availability as a boolean that defaults to true
end

RSpec.describe Transaction, :transaction, type: :model do


  # TODO:
end

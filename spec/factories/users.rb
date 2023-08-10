require "faker"

FactoryBot.define do
  factory User do
    full_name { Faker::Name.name }
    username { "Zookeeper" }
    country { Faker::Address.country }
    email { Faker::Internet.email  }
    password { Faker::Internet.password }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end

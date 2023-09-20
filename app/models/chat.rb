class Chat < ApplicationRecord
  has_and_belongs_to_many :recipients, class_name: 'User', join_table: 'chats_users'
end

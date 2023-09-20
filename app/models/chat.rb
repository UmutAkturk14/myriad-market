class Chat < ApplicationRecord
  has_and_belongs_to_many :recipients, class_name: 'User'
  has_many :messages

  validate :unique_recipients_within_chat

  private

  def unique_recipients_within_chat
    if recipients.size == 2
      user1 = recipients[0]
      user2 = recipients[1]

      # Check if a chat already exists between user1 and user2
      if Chat.joins(:recipients).where(users: { id: [user1.id, user2.id] }).exists? ||
         Chat.joins(:recipients).where(users: { id: [user2.id, user1.id] }).exists?
        errors.add(:base, 'Chat between these users already exists')
      end
    end
  end
end

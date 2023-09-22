class AddUniqueConstraintToChatsUsers < ActiveRecord::Migration[7.0]
  def change
    # Add a unique constraint on user_id and chat_id in the chats_users table
    add_index :chats_users, [:user_id, :chat_id], unique: true
  end
end

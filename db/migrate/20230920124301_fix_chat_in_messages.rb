class FixChatInMessages < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :messages, :chats
    change_column :messages, :chat_id, :integer, null: true
  end
end

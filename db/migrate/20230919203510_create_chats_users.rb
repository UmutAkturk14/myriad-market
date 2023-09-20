class CreateChatsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :chats_users, id: false do |t|
      t.belongs_to :chat
      t.belongs_to :user
    end

    add_index :chats_users, [:chat_id, :user_id], unique: true
  end
end

class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.timestamps
    end

    # Create a join table for the recipients
    create_table :chats_recipients, id: false do |t|
      t.belongs_to :chat
      t.belongs_to :recipient, class_name: 'Chat'
    end

    add_index :chats_recipients, [:chat_id, :recipient_id], unique: true
  end
end

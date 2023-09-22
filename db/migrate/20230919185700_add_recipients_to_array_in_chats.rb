class AddRecipientsToArrayInChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :recipients, :string, array: true, default: []
  end
end

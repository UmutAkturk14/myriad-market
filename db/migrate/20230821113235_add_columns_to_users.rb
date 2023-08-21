class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :about, :text
    add_column :users, :phone_number_visible, :boolean
    add_column :users, :account_type, :string
  end
end

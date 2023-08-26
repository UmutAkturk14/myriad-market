class AddAddressoptionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address_visible, :boolean, default: false
  end
end

class AddEmailVisibilityToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_visible, :boolean
  end
end

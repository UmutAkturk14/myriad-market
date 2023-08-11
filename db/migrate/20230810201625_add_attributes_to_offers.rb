class AddAttributesToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :is_available, :boolean
    add_column :offers, :up_for, :string
  end
end

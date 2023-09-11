class AddVisibilityToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :visible, :boolean
  end
end

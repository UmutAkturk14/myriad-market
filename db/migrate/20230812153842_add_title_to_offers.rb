class AddTitleToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :title, :string
  end
end

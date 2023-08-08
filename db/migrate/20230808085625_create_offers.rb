class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :offerable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

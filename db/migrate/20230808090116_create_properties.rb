class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :property_type
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :square_feet
      t.integer :age
      t.integer :floor
      t.integer :price
      t.string :address
      t.string :city
      t.string :state
      t.text :description

      t.timestamps
    end
  end
end

class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_type
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mileage
      t.integer :price, limit: 12
      t.string :fuel_type
      t.string :transmission
      t.text :description

      t.timestamps
    end
  end
end

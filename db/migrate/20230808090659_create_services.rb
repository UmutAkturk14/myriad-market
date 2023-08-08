class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :service_type
      t.string :title
      t.integer :hourly_rate, limit: 6
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end

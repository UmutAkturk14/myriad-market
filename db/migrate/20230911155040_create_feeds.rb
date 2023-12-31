class CreateFeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :feeds do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :offer, foreign_key: true

      t.timestamps
    end
  end
end

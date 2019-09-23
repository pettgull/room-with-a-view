class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :hourly_rate
      t.string :photo
      t.date :start_date
      t.date :end_date
      t.text :description
      t.boolean :commercial_use
      t.boolean :monument
      t.boolean :landscape
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

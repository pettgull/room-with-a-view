class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :total_price
      t.boolean :accepted
      t.boolean :cancelled
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end

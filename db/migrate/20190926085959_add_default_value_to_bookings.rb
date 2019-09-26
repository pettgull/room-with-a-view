class AddDefaultValueToBookings < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :accepted, false
    change_column_default :bookings, :cancelled, false
  end
end

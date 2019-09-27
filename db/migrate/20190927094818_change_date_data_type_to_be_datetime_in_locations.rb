class ChangeDateDataTypeToBeDatetimeInLocations < ActiveRecord::Migration[5.2]
  def change
    change_column :locations, :start_date, :datetime
    change_column :locations, :end_date, :datetime
  end
end

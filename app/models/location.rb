class Location < ApplicationRecord
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :address, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true }
  # validates :photo, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader

  def available?(start_date, end_date)
    where = "bookings.location_id = ? AND bookings.start_date <= ? AND bookings.end_date >= ?"
    is_booked = Location.joins(:bookings).where(where, self.id, end_date, start_date).any?
    !is_booked
  end
end

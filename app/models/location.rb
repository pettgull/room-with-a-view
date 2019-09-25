class Location < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :address, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true }
  # validates :photo, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
end

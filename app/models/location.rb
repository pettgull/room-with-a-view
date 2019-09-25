class Location < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :address, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true }
  validates :photo, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
end

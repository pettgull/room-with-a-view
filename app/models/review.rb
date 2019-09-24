class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :rating, presence: true, numericality: true
  validates :description, presence: true
  validates :date, presence: true
end

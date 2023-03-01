class Location < ApplicationRecord
  has_many :runs
  validates :name, :latitude, :longitude, :description, :photos, presence: true
  has_many_attached :photos
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?
end

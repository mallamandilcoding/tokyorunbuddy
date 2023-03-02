class Run < ApplicationRecord
  belongs_to :user
  belongs_to :location
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location_id?
  has_many_attached :photos
  validates :date, :start_time, :end_time, :status, :weather_description, :wind, :humidity, :precipitation, :temperature, :air_quality, presence: true
end

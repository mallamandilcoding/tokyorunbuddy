class Run < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :date, :start_time, :end_time, :status, :weather_description, :wind, :humidity, :precipitation, :temperature, :air_quality, :user, presence: true
end

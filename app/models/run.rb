class Run < ApplicationRecord
  belongs_to :user
  belongs_to :location
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location_id?
  has_many_attached :photos
  validates :start_time, :end_time, :status, :weather_description, :wind, :humidity, :precipitation, :temperature, :air_quality, presence: true

  def weather
    location = self.location
    return {} if self.status == 'completed'

    weather_api = WeatherApi.new(location, DateTime.new(self.start_time.year, self.start_time.month, self.start_time.day, self.start_time.hour, self.start_time.min, self.start_time.sec, self.start_time.zone))
    weather_api.get_weather
  end
end

require 'open-uri'
require 'json'

class WeatherApi
  def initialize(location, timestamp)
    @location = location
    @latitude = @location.latitude
    @longitude = @location.longitude
    @timestamp = timestamp
  end

  def get_weather
    weather_info = {}
    weather_url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{@latitude}&lon=#{@longitude}&units=metric&exclude=minutely,alerts&appid=#{ENV['WEATHER_KEY']}"
    weather_response = URI.open(weather_url).read
    weather_data = JSON.parse(weather_response)

    air_quality_url = "http://api.openweathermap.org/data/2.5/air_pollution?lat=#{@latitude}&lon=#{@longitude}&appid=#{ENV['WEATHER_KEY']}"
    air_quality_response = URI.open(air_quality_url).read
    air_quality_data = JSON.parse(air_quality_response)

    # within_two_days = Time.at(@timestamp).between?(Date.today, Date.today + 2)
    weather_data['daily'].select do |hash|
      raise
     if hash["dt"].to_i == @timestamp
        weather_info["weather_description"] = hash['weather'][0]['description'].capitalize
        weather_info["wind"] = hash['wind_speed']
        weather_info["temperature"] = hash['temp']['day'] - 273.15
        weather_info["humidity"] = hash['humidity']
        weather_info["precipitation"] = hash['rain'] ? hash['rain']['1h'] : 0
       end
    end
    weather_info["air_quality"] = air_quality_data['list'][0]['main']['aqi']
    return weather_info
  end
end

# If you want to test the code above, follow the steps below in rails console:
# location = Location.create(name: "insert address here")
# weather_api = WeatherApi.new(location, timestamp)

# This will return a hash
# weather_for_my_location = weather_api.get_weather

# To access a key in the hash
# weather_for_my_location["wind"]

require 'open-uri'
require 'json'

class WeatherApi
  def initialize(run)
    @run = run
    @latitude = @run.latitude
    @longitude = @run.longitude
  end

  def get_weather
    weather_info = {}
    weather_url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{@latitude}&lon=#{@longitude}&units=metric&exclude=minutely,alerts&appid=#{ENV['WEATHER_KEY']}"
    weather_response = URI.open(weather_url).read
    weather_data = JSON.parse(weather_response)

    air_quality_url = "http://api.openweathermap.org/data/2.5/air_pollution?lat=#{@latitude}&lon=#{@longitude}&appid=#{ENV['WEATHER_KEY']}"
    air_quality_response = URI.open(air_quality_url).read
    air_quality_data = JSON.parse(air_quality_response)

    weather_info["description"] = weather_data['current']['weather'][0]['description']
    # weather_info["weather"] = weather_data['current']['weather'][0]['id']
    weather_info["wind"] = weather_data['current']['wind_speed']
    weather_info["humidity"] = weather_data['current']['humidity']
    weather_info["precipitation"] = weather_data['current']['rain'] ? weather_data['current']['rain']['1h'] : 0
    weather_info["air_quality"] = air_quality_data['list'][0]['main']['aqi']
    return weather_info
  end
end

# @run
# weather_api = WeatherApi.new(@run)
# weather_for_my_run = weather_api.get_weather
# weather_for_my_run["wind"]

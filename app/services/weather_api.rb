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
     if Time.at(hash["dt"]).to_datetime.day == @timestamp.day
        weather_info["weather_description"] = hash['weather'][0]['description'].capitalize
        weather_info["wind"] = hash['wind_speed']
        weather_info["temperature"] = hash['temp']['day'].to_i
        weather_info["humidity"] = hash['humidity']
        # weather_info["precipitation"] = hash['rain'] ? hash['rain']['1h'] : 0
       end
    end
    weather_info["air_quality"] = air_quality_data['list'][0]['main']['aqi']
    return weather_info
    # return weather_data
  end

  def self.air_quality_level(number)
    text = ""
    case number
    when 1
      text = "Good: The air is clean and healthy, so breathe easy and enjoy the fresh air."
    when 2
      text = "Fair: The air quality is okay, but if you're sensitive to pollutants, you might want to take it easy and avoid prolonged exposure."
    when 3
      text = "Moderate: The air quality is not great, so you might want to consider reducing your time outside or avoiding outdoor activities if you're sensitive to pollution."
    when 4
      text = "Poor: The air quality is pretty bad, so it's best to limit your time outside and take precautions to protect your health."
    else
      text = "Very Poor: The air quality is really bad, so it's important to stay indoors if possible and take extra precautions if you must go outside."
    end
  end

  def self.humidity_level(percentage)
    percent = ""
    case percentage
    when 0..30
      percent = "Very dry: This percentage can make for great running conditions with minimal sweat and good traction."
    when 31..60
      percent = "Comfortable: Comfortable humidity level for most runners, providing good hydration without feeling too sticky or clammy."
    when 61..80
      percent = "Sticky: Humidity levels between 60% and 80% can make for challenging running conditions, with increased sweat and a higher risk of dehydration."
    else
      percent = "Very Humid: Humidity levels above 80% are oppressive and can make running feel like an uphill battle, with high levels of fatigue, discomfort, and risk of heat-related illness."
    end
    return percent
  end
end

# If you want to test the code above, follow the steps below in rails console:
# location = Location.create(name: "insert address here")
# weather_api = WeatherApi.new(location, timestamp)

# This will return a hash
# weather_for_my_location = weather_api.get_weather

# To access a key in the hash
# weather_for_my_location["wind"]



# Good: The air is clean and healthy, so breathe easy and enjoy the fresh air.

# Fair: The air quality is okay, but if you're sensitive to pollutants, you might want to take it easy and avoid prolonged exposure.

# Moderate: The air quality is not great, so you might want to consider reducing your time outside or avoiding outdoor activities if you're sensitive to pollution.

# Poor: The air quality is pretty bad, so it's best to limit your time outside and take precautions to protect your health.

# Very Poor: The air quality is really bad, so it's important to stay indoors if possible and take extra precautions if you must go outside.

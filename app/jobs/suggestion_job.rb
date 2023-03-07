require 'open-uri'
require 'json'

class SuggestionJob < ApplicationJob
  queue_as :default

  # This method will run at 6 am every day
  def perform
    # Set the time zone to Tokyo
    Time.zone = "Tokyo"
    # Find all users who have set their preferred time of day
    User.where.not(time_of_day_preference: nil).find_each do |user|
      # Generate three suggestions for each user
      3.times do
        # Choose a random day within the next 7 days
        date = Date.current + rand(7).days

        # Choose a random start time within the user's preferred time of day
        start_time = choose_start_time(date, user.time_of_day_preference)

        # Check the weather forecast for Tokyo on that date and time using One Call API 3.0 from Open Weather
        forecast = check_weather_forecast(date, start_time)

        # Skip this suggestion if there is rain or snow in the forecast
        next if forecast[:weather].any? { |w| w["main"] == "Rain" || w["main"] == "Snow" }

        # Choose a random location from a predefined list of running spots in Tokyo
        locations = Location.all
        location = locations.sample

        # Create a suggestion card with the date, start time, end time and location
        Run.create(
          user: user,
          status: "suggested",
          start_time: start_time,
          end_time: start_time + 2.hours,
          location: location,
          weather_description: forecast[:weather_description],
          wind: forecast[:wind],
          humidity: forecast[:humidity],
          precipitation: 0.0,
          temperature: forecast[:temperature],
          air_quality: 1
        )
      end
    end
  end

  private

  # This method returns a random start time within the given date and time of day range (morning, afternoon or evening)
  def choose_start_time(date, time_of_day)
    case time_of_day.downcase.strip
    when "morning"
      min_hour = 7   # Earliest possible hour for morning run (7 am)
      max_hour = 11  # Latest possible hour for morning run (11 am)
    when "afternoon"
      min_hour = 12   # Earliest possible hour for afternoon run (12 pm)
      max_hour = 16   # Latest possible hour for afternoon run (4 pm)
    when "evening"
      min_hour = 17   # Earliest possible hour for evening run (5 pm)
      max_hour = 21   # Latest possible hour for evening run (9 pm)
    else
      raise ArgumentError.new("Invalid time of day: #{time_of_day}")
    end

    # Choose a random hour between min_hour and max_hour (inclusive)
    hour = rand(min_hour..max_hour)

    # Convert the date and hour to a DateTime object with minutes set to zero
    DateTime.new(date.year, date.month, date.day, hour, 0, 0, '+9')
  end

  # This method returns a hash with weather data for a given date and time using One Call API 3.0 from Open Weather
  def check_weather_forecast(date, start_time)
    # Convert date and start_time to Unix timestamp
    timestamp = date.to_time.to_i + (start_time.hour * 3600)

    # Set your API key, latitude and longitude of Tokyo
    api_key = ENV.fetch('WEATHER_KEY')
    lat = "35.6895"
    lon = "139.6917"

    # Make a GET request to One Call API endpoint with exclude and units parameters
    response = URI.open("https://api.openweathermap.org/data/3.0/onecall?lat=#{lat}&lon=#{lon}&exclude=current,minutely,hourly,alerts&appid=#{api_key}").read

    # Parse JSON response
    data = JSON.parse(response)

    # Find daily object that matches start time timestamp
    daily = data["daily"].find { |d| d["dt"] >= timestamp }

    # Return weather and temp properties from daily object
    {
      weather: daily["weather"],
      weather_description: daily["weather"][0]["description"].capitalize,
      wind: daily["wind_speed"],
      humidity: daily["humidity"],
      temperature: daily["temp"]["day"] - 273.15 # Convert Kelvin to Celsius
    }
  end
end

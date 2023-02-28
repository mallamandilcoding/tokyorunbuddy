require 'open-uri'
require 'json'

api_key = "4fdf24cc8340f549948501271ef44d23"
latitude = 35.67
longitude = 139.77

url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{latitude}&lon=#{longitude}&exclude=minutely,alerts&appid=#{api_key}"
response = URI.open(url).read
data = JSON.parse(response)


class RunsController < ApplicationController
  def suggestions
  end

  def trends
  end

  def index
    # @bookings = policy_scope(Booking) (eg)
    @runnings = policy_scope(Run)
  end

  def edit
    # do the logic here
    authorize @run
  end

  def show
    # do the logic here
    authorize @run
  end

  def update
    # do the logic here
    authorize @run
  end

  def destroy
    # do the logic here
    authorize @run
  end
end

class RunsController < ApplicationController

  # scope :scheduledruns, -> { where(status: "scheduled") }
  def suggestions
  end

  def trends
  end

  def index
    # @bookings = policy_scope(Booking) (eg)
    @runs = policy_scope(Run)
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

  private

  def run_params
    params.require(:run).permit(:date, :start_time, :end_time, :status, :weather_description, :wind, :humidity, :precipitation, :air_quality, :temperature)
  end
end

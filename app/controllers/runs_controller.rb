class RunsController < ApplicationController
  skip_after_action :verify_authorized, only: [:suggestions, :show]
  def suggestions
  @runnings = current_user.runs.where(status: "suggested")
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
    params.require(:run).permit(:date, :start_time, :end_time, :status, :location, :description, :weather, :wind, :humidity, :precipitation, :air_quality, photos: [])
  end
end

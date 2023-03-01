class RunsController < ApplicationController
  def suggestions
    authorize @run
  end

  def trends
  end

  def index
    # @bookings = policy_scope(Booking) (eg)
    @runnings = policy_scope(Run)
  end

  def edit
    # do the logic here
    # @run = Run.find(params[:id])
    # authorize @run
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
    params.require(:run).permit(:date, :start_time, :end_time, :status, :location, :description, :weather, :wind, :humidity, :precipitation, :air_quality, photos: [])
  end
end

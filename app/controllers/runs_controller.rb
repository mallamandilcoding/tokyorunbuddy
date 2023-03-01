class RunsController < ApplicationController
  skip_after_action :verify_authorized, only: [:edit, :update, :suggestions, :show]

  def suggestions
  @runnings = current_user.runs.where(status: "suggested")
  end

  def trends
  end

  def index
    # @bookings = policy_scope(Booking) (eg)
    @runs = policy_scope(Run)
  end

  def edit
    # do the logic here
    # @run = Run.new
    @run = Run.find(params[:id])
    # authorize @run
  end

  def show
    # do the logic here
  end

  def update
    # raise;
    @run = Run.find(params[:id])
    if @run.update(run_params)
      redirect_to run_path(@run)
    else
      render :edit, status: :unprocessable_entity
    end
    # do the logic here
    # authorize @run
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

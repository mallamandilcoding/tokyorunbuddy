class RunsController < ApplicationController
  skip_after_action :verify_authorized, only: [:edit, :update, :suggestions, :show, :trends]

  def suggestions
    @message = "Let's go for a run!"
    @upcoming_runs = current_user.runs.where(status: "scheduled").order(date: :asc).limit(3)
    @suggested_runs = current_user.runs.where(status: "suggested")
    # @runs = policy_scope(Run)
  end

  def trends
    @completed_runs = current_user.runs.where(status: "completed")
  end

  def index
    # @bookings = policy_scope(Booking) (eg)
    # @runs = policy_scope(Run)
    @upcoming_runs = current_user.runs.where(status: "scheduled")
    @suggested_runs = current_user.runs.where(status: "suggested")
    @completed_runs = current_user.runs.where(status: "completed")
    @incomplete_runs = current_user.runs.where(status: "incompleted")
  end

  def edit
    # do the logic here
    # @run = Run.new
    @run = Run.find(params[:id])
    # authorize @run
  end

  def show
    @run = Run.find(params[:id])
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

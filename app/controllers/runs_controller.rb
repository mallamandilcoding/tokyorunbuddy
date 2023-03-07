class RunsController < ApplicationController
  skip_after_action :verify_authorized, only: [:edit, :update, :suggestions, :show, :trends]

  def suggestions
    @message1 = "Welcome, "
    @message2 = "Let's go for a run!"
    @color = "warning"
    @upcoming_runs = current_user.runs.where(status: "scheduled").order(start_time: :asc).limit(3)
    @suggested_runs = current_user.runs.where(status: "suggested")
    # @runs = policy_scope(Run)
  end

  def trends
    @color = "primary"
    @completed_runs = current_user.runs.where(status: "completed")
    @message1 = "Good job, "
    @message2 = "Let's schedule another run."
    @totalruns = @completed_runs.count
    count_morn = 0
    count_afternoon = 0
    count_evening = 0
    temperature = 0
    @completed_runs.each do |t|
      # time = Time.parse(t.start_time.strftime("%I:%M %p"))
      time = Time.parse("1pm")
      temperature += t.temperature
      if time < Time.parse("12pm")
        count_morn += 1
      elsif time > Time.parse("12pm") && time < Time.parse("6pm")
        count_afternoon += 1
      else
        count_evening += 1
      end
    end
    max_variable = { 'morning' => count_morn, 'afternoon' => count_afternoon, 'evening' => count_evening}.max_by{|k, v| v}
    @time_of_day = max_variable[0]
    @average_temperature = temperature / @totalruns
  end

  def index
    # @bookings = policy_scope(Booking) (eg)
    @color = "primary"
    @message1 = "Welcome, "
    @message2 = "Ready for your next run?"
    @runs = policy_scope(Run).group_by {|run| run.status}
    # raise
    # @upcoming_runs = current_user.runs.where(status: "scheduled")
    # @suggested_runs = current_user.runs.where(status: "suggested")
    # @completed_runs = current_user.runs.where(status: "completed")
    # @incomplete_runs = current_user.runs.where(status: "incompleted")
  end

  # freetimes=[
  #   {date: Date.new(2023, 3, 3),
  #     start_time: Time.new(2023, 3, 3, 20, 0),
  #     end_time: Time.new(2023, 3, 3, 22, 0)},
  #     {
  #       date: Date.new(2023, 3, 4),
  #   start_time: Time.new(2023, 3, 4, 16, 0),
  #   end_time: Time.new(2023, 3, 4, 18, 0),
  #     }
  # ]
  # location = locations.sample



  def edit
    # do the logic here
    # @run = Run.new
    @run = Run.find(params[:id])
    # authorize @run
  end

  def show
    @run = Run.find(params[:id])
    @scheduled = @run.status == "scheduled"
  end

  def update
    # raise;
    @run = Run.find(params[:id])
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to run_path(@run) }
        format.json
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json
      end
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
    params.require(:run).permit(:start_time, :end_time, :status, :weather_description, :wind, :humidity, :precipitation, :air_quality, :temperature)

  end

  # def generate_runs
  #   freetimes = generate_freetime
  #   freetimes.each do |freetime|
  #     weather_api = WeatherApi.new(location)
  #     weather_for_this_location = weather_api.get_weather
  #     run_info = {
  #     date: freetime['date'],
  #     start_time: freetime['start_time'],
  #     end_time: freetime['end_time'],
  #     status: "suggested",
  #     weather_description: weather_for_this_location["weather_description"],
  #     wind: weather_for_this_location["wind"],
  #     humidity: weather_for_this_location["humidity"],
  #     precipitation: weather_for_this_location["precipitation"],
  #     temperature: weather_for_this_location["temperature"],
  #     air_quality: weather_for_this_location["air_quality"],
  #     user: current_user,
  #     location: current_user.locations.sample
  #     }
  #     @run = Run.create(run_info)
  #   end
  # end

  # def generate_freetime
  #   [
  #   {date: Date.new(2023, 3, 3),
  #   start_time: Time.new(2023, 3, 3, 20, 0),
  #   end_time: Time.new(2023, 3, 3, 22, 0)},
  #   {
  #     date: Date.new(2023, 3, 4),
  #   start_time: Time.new(2023, 3, 4, 16, 0),
  #   end_time: Time.new(2023, 3, 4, 18, 0),
  #   }
  #   ]
  # end
end

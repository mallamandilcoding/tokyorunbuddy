class RunsController < ApplicationController
  skip_after_action :verify_authorized, only: [:edit, :update, :suggestions, :show, :trends]

  def suggestions
    @message1 = "Welcome, "
    @message2 = "Let's go for a run!"
    @color = "primary"
    @upcoming_runs = current_user.runs.where(status: "scheduled").order(start_time: :asc).limit(3)
    @suggested_runs = current_user.runs.where(status: "suggested")
    # @runs = policy_scope(Run)
  end

  def trends
    @color = "warning"
    @completed_runs = current_user.runs.where(status: "completed")
    @message1 = "Good job, "
    @message2 = "Let's schedule another run."
    @totalruns = @completed_runs.count
    count_morn = 0
    count_afternoon = 0
    count_evening = 0
    temperature = 0
    cold_temperatures = 0
    cool_temperatures = 0
    comfortable_temperatures = 0
    warm_temperatures = 0
    hot_temperatures = 0
    @location_counts = @completed_runs.group_by { |run| run.location.name }.transform_values{ |val| val.count }
    # @location = @completed_runs.group_by { |run| run.location.name}.transform_values{|val| val.count}.max_by{|k, v| v}
    @completed_runs.each do |t|
      time = Time.parse(t.start_time.strftime("%I:%M %p"))
      # time = Time.parse("1pm")
      case t.temperature
        when 0..12
          cold_temperatures += 1
        when 13..17
          cool_temperatures += 1
        when 18..23
          comfortable_temperatures += 1
        when 24..28
          warm_temperatures += 1
        else
          hot_temperatures += 1
      end
      @temperatures = {'cold' => cold_temperatures, 'cool' => cool_temperatures, 'comfortable' => comfortable_temperatures, 'warm' => warm_temperatures, 'hot' => hot_temperatures}
      @temperature = {'cold' => cold_temperatures, 'warm' => warm_temperatures, 'hot' => hot_temperatures}.max_by{|k, v| v}
      if time < Time.parse("12pm")
        count_morn += 1
      elsif time > Time.parse("12pm") && time < Time.parse("5pm")
        count_afternoon += 1
      else
        count_evening += 1
      end
    end
    # max_variable = { 'morning' => count_morn, 'afternoon' => count_afternoon, 'evening' => count_evening}.max_by{|k, v| v}

    @time_of_days = { 'morning' => count_morn, 'afternoon' => count_afternoon, 'evening' => count_evening}
    @time_of_day = { 'morning' => count_morn, 'afternoon' => count_afternoon, 'evening' => count_evening}.max_by{|k, v| v}

    # @time_of_day = max_variable[0]
    # @average_temperature = temperature / @totalruns
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
    # @run = Run.find(params[:id])
    # authorize @run
  end

  def show
    @run = Run.find(params[:id])
    @scheduled = @run.status == "scheduled"
    location = @run.location
    # weather_api = WeatherApi.new(location, DateTime.new(@run.start_time.year, @run.start_time.month, @run.start_time.day, @run.start_time.hour, @run.start_time.min, @run.start_time.sec, @run.start_time.zone))
    @weather_for_this_location = @run.weather
    @air_quality = WeatherApi.air_quality_level(@weather_for_this_location["air_quality"])
    @humidity_description = WeatherApi.humidity_level(@weather_for_this_location["humidity"].to_i)
  end

  def update
    # raise;
    @run = Run.find(params[:id])
    @run.status = "scheduled"
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to run_path(@run) }
        format.json { @run }
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

end

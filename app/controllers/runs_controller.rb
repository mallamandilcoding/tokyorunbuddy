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

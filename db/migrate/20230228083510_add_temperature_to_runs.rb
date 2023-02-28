class AddTemperatureToRuns < ActiveRecord::Migration[7.0]
  def change
    add_column :runs, :temperature, :integer
  end
end

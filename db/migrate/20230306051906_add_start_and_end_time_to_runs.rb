class AddStartAndEndTimeToRuns < ActiveRecord::Migration[7.0]
  def change
    add_column :runs, :start_time, :datetime
    add_column :runs, :end_time, :datetime
  end
end

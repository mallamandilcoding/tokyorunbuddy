class RemoveTimesFromRuns < ActiveRecord::Migration[7.0]
  def change
    remove_column :runs, :start_time, :time
    remove_column :runs, :end_time, :time
  end
end

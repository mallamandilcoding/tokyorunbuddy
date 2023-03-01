class RemoveLongitudeFromRuns < ActiveRecord::Migration[7.0]
  def change
    remove_column :runs, :longitude, :float
  end
end

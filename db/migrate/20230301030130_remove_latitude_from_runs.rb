class RemoveLatitudeFromRuns < ActiveRecord::Migration[7.0]
  def change
    remove_column :runs, :latitude, :float
  end
end

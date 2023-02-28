class RemoveLocationFromRuns < ActiveRecord::Migration[7.0]
  def change
    remove_column :runs, :location, :string
  end
end

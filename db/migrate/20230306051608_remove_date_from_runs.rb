class RemoveDateFromRuns < ActiveRecord::Migration[7.0]
  def change
    remove_column :runs, :date, :date
  end
end

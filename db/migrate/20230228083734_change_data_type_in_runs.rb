class ChangeDataTypeInRuns < ActiveRecord::Migration[7.0]
  def change
    change_column :runs, :humidity, :float
  end
end

class ChangeColumnNameAndDataTypeInRuns < ActiveRecord::Migration[7.0]
  def change
    rename_column :runs, :weather, :weather_description
    change_column :runs, :weather_description, :text
  end
end

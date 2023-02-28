class CreateRuns < ActiveRecord::Migration[7.0]
  def change
    create_table :runs do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :status
      t.string :location
      t.text :description
      t.integer :weather
      t.float :wind
      t.integer :humidity
      t.float :precipitation
      t.integer :air_quality
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

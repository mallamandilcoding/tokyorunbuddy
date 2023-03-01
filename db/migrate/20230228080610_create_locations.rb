class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :description
      t.references :user, foreign_key: true, optional: true

      t.timestamps
    end
  end
end

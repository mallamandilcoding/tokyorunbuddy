class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :time_of_day_preference, :string
    add_column :users, :temperature_preference, :integer
  end
end

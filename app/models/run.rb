class Run < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :date, :start_time, :end_time, :status, :location, :wind, :humidity, :precipitation, :air_quality, :user, presence:true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location_id?

  has_many_attached :photos

end

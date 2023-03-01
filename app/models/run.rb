class Run < ApplicationRecord
  belongs_to :user
  validates :date, :start_time, :end_time, :status, :location, :description, :weather, :wind, :humidity, :precipitation, :air_quality, :user, presence:true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_many_attached :photos

end

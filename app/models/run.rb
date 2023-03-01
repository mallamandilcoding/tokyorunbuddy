class Run < ApplicationRecord
  belongs_to :user
  validates :date, :start_time, :end_time, :status, :location, :description, :weather, :wind, :humidity, :precipitation, :air_quality, :user, presence:true

  has_many_attached :photos

end

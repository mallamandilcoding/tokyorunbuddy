class Location < ApplicationRecord
  belongs_to :user, optional: true
  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?
  has_many :runs
  validates :name, :latitude, :longitude, :description, :photos, presence: true
  has_many_attached :photos
end

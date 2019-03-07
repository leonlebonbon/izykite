class Experience < ApplicationRecord
  validates :name, :user, :price_per_day, :description, :photo, :address, :minimum_stay, presence: true
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

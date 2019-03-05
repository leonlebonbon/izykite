class Experience < ApplicationRecord
  validates :name, :user, :price_per_day, :description, presence: true
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
end

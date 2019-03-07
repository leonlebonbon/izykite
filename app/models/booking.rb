class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :user
  has_many :reviews
  validates :number_of_kiters, :start_date, :end_date, presence: true
end

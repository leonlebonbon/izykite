class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :user
  validates :number_of_kiters, :start_date, :end_date, presence: true
end

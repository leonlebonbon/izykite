class Booking < ApplicationRecord
  validates :number_of_kiters, :start_date, :end_date, presence: true
  belongs_to :experience
  belongs_to :user
end

class Booking < ApplicationRecord
  validates :experience, :user, :start_date, :end_date, :number_of_kiters, presence: true
  belongs_to :experience
  belongs_to :user
end

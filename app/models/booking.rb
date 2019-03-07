class Booking < ApplicationRecord
  belongs_to :experience
  belongs_to :user
  has_many :reviews
  validates :number_of_kiters, :start_date, :end_date, presence: true
  validate :stay_longer_than_required?

  private

  def stay_longer_than_required?
    start = Date.parse(self.start_date.split(" ")[0]).mjd
    date_end = Date.parse(self.end_date).mjd
    result = true
    if experience.minimum_stay != nil
      result = (date_end - start) >= self.experience.minimum_stay
    end
    unless (result)
      errors.add(:start_date, "Minimum stay should be #{experience.minimum_stay}")
    end
    # return result
  end
end

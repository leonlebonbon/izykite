class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :experience
  validates :rating, presence: true, inclusion: { in: (0..5).to_a }
end

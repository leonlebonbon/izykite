class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :user, through: :booking
  belongs_to :experience, through: :booking
  validates :rating, presence: :true, inclusion: { in: (0..5).to_a }
end

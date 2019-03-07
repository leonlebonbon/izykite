class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, presence: true, inclusion: 0..5
end

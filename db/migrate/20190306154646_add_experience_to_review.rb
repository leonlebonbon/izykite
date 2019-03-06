class AddExperienceToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :experience, foreign_key: true
  end
end

class RemoveExperienceFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :experience_id
  end
end

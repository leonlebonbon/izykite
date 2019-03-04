class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :address
      t.string :photo
      t.references :user, foreign_key: true
      t.integer :price_per_day
      t.string :name
      t.integer :minimum_stay
      t.text :description

      t.timestamps
    end
  end
end

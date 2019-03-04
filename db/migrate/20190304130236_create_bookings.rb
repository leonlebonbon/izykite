class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :experience, foreign_key: true
      t.references :user, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.integer :total_price
      t.boolean :confirmed
      t.integer :number_of_kiters

      t.timestamps
    end
  end
end

class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :day
      t.time :start_time
      t.time :end_time
      t.string :user_email
      t.string :note
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end

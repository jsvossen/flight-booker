class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :flight, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

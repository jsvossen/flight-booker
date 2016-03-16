class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :from_airport, index: true, foreign_key: true, null: false
      t.references :to_airport, index: true, foreign_key: true, null: false

      t.datetime :departure, null: false
      t.decimal :duration, precision: 6, scale: 2, null: false

      t.timestamps null: false
    end
  end
end

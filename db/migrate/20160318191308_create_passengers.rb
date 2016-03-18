class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :booking, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

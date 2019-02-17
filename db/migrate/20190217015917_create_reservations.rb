class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :date, null: false
      t.integer :time, null: false
      t.integer :user_id, null: false
      t.integer :car_id, null: false

      t.timestamps
    end
  end
end

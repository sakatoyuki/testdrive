class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.date :date, null: false
      t.time :time, null: false
      t.integer :availables, null: false
      t.integer :car_id

      t.timestamps
    end
  end
end

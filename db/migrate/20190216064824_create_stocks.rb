class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :date, null: false
      t.integer :time, null: false
      t.integer :availables, null: false
      t.integer :car_id, null: false

      t.timestamps
    end
  end
end

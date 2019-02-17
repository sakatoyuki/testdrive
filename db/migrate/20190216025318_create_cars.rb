class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name, null: false
      t.integer :count, null: false
      t.string :car_image, null: false
      t.integer :dealer_id, null: false

      t.timestamps
    end
  end
end

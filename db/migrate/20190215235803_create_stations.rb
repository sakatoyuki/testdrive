class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :name, null: false
      t.string :waiting_spot, null: false
      t.string :map_image, null: false
      t.integer :dealer_id, null: false

      t.timestamps
    end
  end
end

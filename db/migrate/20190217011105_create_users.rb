class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :tel, null: false
      t.integer :postalcode, null: false
      t.string :address, null: false
      t.integer :current_maker, null: false
      t.string :current_car, null: false
      t.string :status, null: false
      t.string :candidate, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end

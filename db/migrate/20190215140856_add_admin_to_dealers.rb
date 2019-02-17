class AddAdminToDealers < ActiveRecord::Migration[5.2]
  def change
    add_column :dealers, :admin, :boolean, default: false, null: false
  end
end

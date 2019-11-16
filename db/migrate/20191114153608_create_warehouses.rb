class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.text :wh_code
      t.text :name
      t.integer :pincode
      t.integer :max_capacity

      t.timestamps
    end
    add_index :warehouses, :wh_code, :unique => true
  end
end

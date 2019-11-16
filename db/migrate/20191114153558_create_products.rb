class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :sku_code
      t.text :name
      t.float :price

      t.timestamps
    end
    add_index :products, :sku_code, :unique => true
  end
end

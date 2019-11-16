class CreateProductWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :product_warehouses do |t|
      t.integer :item_count, :default => 0
      t.integer :low_item_threshold, :default => 10
      t.references :product, foreign_key: true
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end

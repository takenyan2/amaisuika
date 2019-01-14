class CreatePurchaseItems < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_items do |t|
      t.integer :product_id
      t.integer :purchase_history_id
      t.string :purchase_product_name
      t.string :purchase_product_image_id
      t.integer :purchase_product_price
      t.integer :purchase_product_quantity
      t.integer :purchase_product_total_price

      t.timestamps
    end
  end
end

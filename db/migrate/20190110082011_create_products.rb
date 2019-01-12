class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :shop_id
      t.string :product_name
      t.string :product_introduction
      t.string :product_genre
      t.integer :product_price
      t.integer :product_stock
      t.boolean :permission, default: "false"

      t.timestamps
    end
  end
end

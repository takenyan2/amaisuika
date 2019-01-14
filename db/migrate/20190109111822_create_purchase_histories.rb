class CreatePurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_histories do |t|
      t.integer :user_id
      t.string :send_address
      t.string :send_name
      t.integer :send_postal_code
      t.string :send_status, default: "受注"
      t.string :purchase_at

      t.timestamps
    end
  end
end

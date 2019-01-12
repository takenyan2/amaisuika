class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :puroduct_id
      t.integer :review
      t.string :comment

      t.timestamps
    end
  end
end
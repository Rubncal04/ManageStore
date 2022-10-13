class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true, null: false
      t.integer :product_quantity
      t.integer :quantity, null: false
      t.string :order_type

      t.timestamps
    end
  end
end

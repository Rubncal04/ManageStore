class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.references :product, foreign_key: true, null: false
      t.integer :quantity

      t.timestamps
    end
  end
end

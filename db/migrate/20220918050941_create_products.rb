class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :name
      t.text :description
      t.integer :main_stotage
      t.integer :current_storage
      t.float :price
      t.timestamps
    end
  end
end

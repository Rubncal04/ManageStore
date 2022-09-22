class FixColumnMainStotage < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :main_stotage, :main_storage
  end
end
